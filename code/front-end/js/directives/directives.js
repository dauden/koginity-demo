angular.module('koginity')
// defined directive load defult image when image not exist or loading error
.directive('errSrc', function() {
  return {
    link: function(scope, element, attrs) {
      element.bind('error', function() {
        if (attrs.src != attrs.errSrc) {
          attrs.$set('src', attrs.errSrc);
        }
      });
    }
  };
})
// defined directive get and apply image by type.
.directive('imgSrc', function () {
    return {
      link: function(scope, element, attrs) {
        var images = JSON.parse(attrs.imgSrc);
        if(images){
          //say there is thumbnail image will be display
          var thumbnail = attrs.isThumbnail;
          //type of image will be display, defaul is primary image
          var type = attrs.imgType || 'primary';
          var image;

          for(var key in images) {
            image = images[key];
            if(image && type === image.type){
              if(!thumbnail)
                attrs.$set('src', image.url);
              else
                attrs.$set('src', image.thumbnail);
              break;
            }
          };
        }
      }
    };
})
// defined directive display ratting with default 5 stars empty.
.directive('starRating', function () {
    return {
      restrict: 'EA',
      template:
        '<div class="star-rating">' +
	        '<i ng-repeat="star in stars track by $index" class="fa fa-star{{star}}" aria-hidden="true"></i>' +
	        ' ({{ratingValue}})'+
        '</div>',
      scope: {
        ratingValue: '=ngModel'
      },
      link: function(scope, element, attributes) {
        var stars = [];
        var className;
          for (var i = 0; i < 5; i++) {
          	//default is empty 
            className = "-o";
            // number still greater than value it is full star
          	if(i < scope.ratingValue)
          		className = "";
            // dynamic number less than 0.5 it is half star
          	if(i < scope.ratingValue && (i + 0.5) >= scope.ratingValue)
          		className = "-half-o";

            stars.push(className);
         }
         
         scope.stars = stars;
      }
    };
}).directive('positionByParentOffset', function() {
    return {
      restrict: 'EA',
      link: function (scope, element, $window) {
          var screenWidth = $(window).width();
          
          element.parent().find(".img-thumbnail").bind('mouseenter', function() {
                element.addClass('active');
                var leftOffset = element.offset().left;
                if(leftOffset > screenWidth / 2){
                   element.css('left', '-' + $(element).width() + 'px');
                }
                
                
          });
          element.parent().find(".img-thumbnail").bind('mouseleave', function() {
               element.removeClass('active');
          });
      }
    }
});