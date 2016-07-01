$(document).ready(function() {
    $('.topSlider .flexslider').flexslider({
        animation: "slide",
        useCSS: false,
        animationLoop: true,
        smoothHeight: true,
        manualControls: '.flex-control-nav li a',
        controlsContainer: '.flex-container',
        start: function (slider) {
            $('body').removeClass('loading');
        },
        before: function (slider) {
            try {
                $f(player).api('pause');
            } catch (ex) {
            }
        }
    });
    $('.topSlider_action .flexslider').flexslider({
        animation: "slide",
        useCSS: false,
        animationLoop: true,
        controlNav: false,
        smoothHeight: true,
        manualControls: '.custom-controls li a',
        controlsContainer: '.flex-container',
        start: function (slider) {
            $('body').removeClass('loading');
        },
        before: function (slider) {
            try {
                $f(player).api('pause');
            } catch (ex) {
            }
        }
    });

    $('.bxslide').bxSlider({
      slideWidth: 390,
      minSlides: 1,
      maxSlides: 3,
      slideMargin: 0
    });
    $('.bxslide2').bxSlider({
      slideMargin: 0,
      controls: false
    });

    $('.bottomSlider .flexslider').flexslider({
        animation: "slide",
        useCSS: false,
        animationLoop: false,
        manualControls: '.flex-control-nav li a',
        smoothHeight: true,
        start: function (slider) {
            $('body').removeClass('loading');
            $('body').trigger('resize');
        },
        after: function (slider) {
        },
        before: function (slider) {
            try {
                $f(player).api('pause');
            } catch (ex) {
            }
        }
    });

});
