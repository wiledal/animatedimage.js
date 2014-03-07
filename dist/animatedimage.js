// Generated by CoffeeScript 1.7.1
(function() {
  var AnimatedImage,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  AnimatedImage = (function() {
    AnimatedImage.prototype.currentFrame = 0;

    AnimatedImage.initiateAll = function(elements) {
      var a, i, _i, _ref, _results;
      _results = [];
      for (i = _i = 0, _ref = elements.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
        a = elements[i];
        _results.push(new AnimatedImage({
          el: a
        }));
      }
      return _results;
    };

    function AnimatedImage(options) {
      this.tick = __bind(this.tick, this);
      var option;
      for (option in options) {
        this[option] = options[option];
      }
      this.imageSrc = this.el.getAttribute("data-src" || null);
      this.startFrame = parseInt(this.el.getAttribute("data-start-frame")) || 0;
      this.frames = parseInt(this.el.getAttribute("data-frames")) || null;
      this.fps = parseInt(this.el.getAttribute("data-fps")) || 24;
      this.yoyo = (this.el.getAttribute("data-yoyo") !== null ? true : false);
      this._direction = 1;
      this.currentFrame = this.startFrame;
      this.maxFrames = this.startFrame + this.frames;
      setInterval(this.tick, 1000 / this.fps);
    }

    AnimatedImage.prototype.tick = function() {
      this.currentFrame += this._direction;
      if (this.currentFrame === this.maxFrames - 1) {
        if (this.yoyo) {
          this._direction = -this._direction;
        } else {
          this.currentFrame = this.startFrame;
        }
      }
      if (this.currentFrame === this.startFrame) {
        if (this.yoyo) {
          this._direction = -this._direction;
        } else {
          this.currentFrame = this.startFrame;
        }
      }
      return this.el.src = this.imageSrc.replace("{n}", this.currentFrame);
    };

    return AnimatedImage;

  })();

  if (typeof window !== "undefined" && window !== null) {
    window.AnimatedImage = AnimatedImage;
  }

  if (typeof module !== "undefined" && module !== null) {
    module.exports = AnimatedImage;
  }

}).call(this);
