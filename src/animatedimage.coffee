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
    @replaceString = @el.getAttribute("data-src").match(/\{([n]+?)\}/)

    @startFrame = parseInt(@el.getAttribute "data-start-frame") || 0
    @frames = parseInt(@el.getAttribute "data-frames") || null
    @fps = parseInt(@el.getAttribute "data-fps") || 24
    @yoyo = (if @el.getAttribute("data-yoyo") != null then true else false)

    @_direction = 1

    @currentFrame = @startFrame
    @maxFrames = @startFrame + @frames - 1

    setInterval @tick, 1000 / @fps

  tick: =>
    @currentFrame += @_direction

    if @yoyo
      if @currentFrame == @maxFrames || @currentFrame == @startFrame
        @_direction = -@_direction
    else
      if @currentFrame > @maxFrames
        @currentFrame = @startFrame

    processedFrame = @prependZerosToNumber(@currentFrame, @replaceString[1].length)
    @el.src = @imageSrc.replace(@replaceString[0], processedFrame)

  prependZerosToNumber: (num, numZeros) ->
    while num.toString().length < numZeros
      num = "0" + num
    return num

# EXPORTS
window?.AnimatedImage = AnimatedImage
module?.exports = AnimatedImage