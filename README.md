# Carousel Panel Demo

Display content in a carousel with the option to auto advance or advance when the user clicks the previous or next arrows.


## Bug
The display status of the plot outputs are not updated in `session$clientData` when the carousel is advanced.  Resizing the window when the carousel is displaying the second frame will cause the second plot to be rendered, but the display status is not updated in `session$clientData`.