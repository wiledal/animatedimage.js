# animatedimage.js
> Simple animated image sequences using data-attributes of an existing image-element.

### Example Usage
##### Place your images
```HTML
<img id="animated" width="200" src="images/animatedimage-1.png" data-src="images/animatedimage-{n}.png" data-start-frame="1" data-frames="6">
<img class="animated" width="200" src="images/animatedimage-1.png" data-src="images/animatedimage-{n}.png" data-start-frame="1" data-frames="6" data-fps="12" data-yoyo>
```

##### Apply the script
You can select individual elements and creating new instances of an AnimatedImage, providing the image element as the `el` in the options object:
```Javascript
var image = document.getElementById("animated");
var animated = new AnimatedImage({el: image});
```
or, you can initiate multiple AnimatedImages by calling the global `initiateAll` method on the class and provide a list of image elements:
```Javascript
AnimatedImage.initiateAll(document.getElementsByClassName("animated"));
```

Check out the __examples__ for further reference.


### Attributes
* `data-src` - string  
The url to the images. `{n}` will be replaced by the current frame number in the playback.

* `data-frames` - number  
The amount of frames in the sequence.

* `data-fps` - number (optional, defalut: `24`)  
The amount of frames in the sequence.

* `data-start-frame` - number (optional, default: `0`)  
Sets the starting frame of the sequence, which is the first image that will be requested.

* `data-yoyo` - boolean (optional, default: `false`)  
If this attribute is present, the animation will change direction and go back and forth in its timeline.


### Release logs
* 0.1.0  
  First release