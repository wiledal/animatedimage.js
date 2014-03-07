class AnimatedImage
  currentFrame: 0

  @initiateAll: (elements) ->
    for i in [0...elements.length]
      a = elements[i]
      new AnimatedImage {el: a}

  constructor: (options) ->
    for option of options
      @[option] = options[option]

    @imageSrc = @el.getAttribute "data-src" || null
    @startFrame = parseInt(@el.getAttribute "data-start-frame") || 0
    @frames = parseInt(@el.getAttribute "data-frames") || null
    @fps = parseInt(@el.getAttribute "data-fps") || 24
    @yoyo = (if @el.getAttribute("data-yoyo") != null then true else false)

    @_direction = 1

    @currentFrame = @startFrame
    @maxFrames = @startFrame + @frames

    setInterval @tick, 1000 / @fps

  tick: =>
    @currentFrame += @_direction
    if @currentFrame == @maxFrames-1
      if @yoyo
        @_direction = -@_direction
      else
        @currentFrame = @startFrame

    if @currentFrame == @startFrame
      if @yoyo
        @_direction = -@_direction
      else
        @currentFrame = @startFrame

    @el.src = @imageSrc.replace("{n}", @currentFrame)

# EXPORTS
window?.AnimatedImage = AnimatedImage
module?.exports = AnimatedImage