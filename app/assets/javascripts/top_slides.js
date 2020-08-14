const top_slides = function() {
  var app = new Vue({
    el: '#top_slides',
    data: {
      slides: 3
    },
    components: {
      'carousel-3d': Carousel3d.Carousel3d,
      'slide': Carousel3d.Slide,
    }
  });
}
