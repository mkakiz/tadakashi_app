const top_slides = function() {
  var app = new Vue({
    el: '#top_slides',
    data: {
      slideData: [
        { text: 'slide text1', image: 'friends.jpg' },
        { text: 'slide text2', image: 'friends.jpg' },
        { text: 'slide text3', image: 'friends.jpg' }
      ],
      descriptions: [
        'current',
        '',
        ''
      ]
    },
    components: {
      'carousel-3d': Carousel3d.Carousel3d,
      'slide': Carousel3d.Slide,
    },
    methods: {
      onAfterSlideChange(index){
        this.descriptions.forEach((obj, objIndex) => {
          index == objIndex ? this.$set(this.descriptions, objIndex, 'current')
          : this.$set(this.descriptions, objIndex, '');
        });
      }
    }
  });
}
