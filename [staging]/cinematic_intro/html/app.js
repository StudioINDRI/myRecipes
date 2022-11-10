
/*(function($){
	function injector(t, splitter, klass, after) {
		var text = t.text()
		, a = text.split(splitter)
		, inject = '';
		if (a.length) {
			$(a).each(function(i, item) {
				inject += '<span class="'+klass+(i+1)+'" aria-hidden="true">'+item+'</span>'+after;
			});
			t.attr('aria-label',text)
			.empty()
			.append(inject)

		}
	}


	var methods = {
		init : function() {

			return this.each(function() {
				injector($(this), '', 'char', '');
			});

		},

		words : function() {

			return this.each(function() {
				injector($(this), ' ', 'word', ' ');
			});

		},

		lines : function() {

			return this.each(function() {
				var r = "eefec303079ad17405c889e092e105b0";
				// Because it's hard to split a <br/> tag consistently across browsers,
				// (*ahem* IE *ahem*), we replace all <br/> instances with an md5 hash
				// (of the word "split").  If you're trying to use this plugin on that
				// md5 hash string, it will fail because you're being ridiculous.
				injector($(this).children("br").replaceWith(r).end(), r, 'line', '');
			});

		}
	};

	$.fn.lettering = function( method ) {
		// Method calling logic
		if ( method && methods[method] ) {
			return methods[ method ].apply( this, [].slice.call( arguments, 1 ));
		} else if ( method === 'letters' || ! method ) {
			return methods.init.apply( this, [].slice.call( arguments, 0 ) ); // always pass an array
		}
		$.error( 'Method ' +  method + ' does not exist on jQuery.lettering' );
		return this;
	};

})(jQuery);*/

QBScoreboard = {}

$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "open":
                QBScoreboard.Open(event.data);
                break;
            case "close":
                QBScoreboard.Close();
                break;
        }
    })
});

var audio = new Audio('/html/song.mp3');

function play() {
    audio.volume = 0.5;
    audio.play();
	setTimeout(() => {
        audio.volume = audio.volume - 0.1125;
    }, 36000);
	setTimeout(() => {
        audio.volume = audio.volume - 0.1125;
    }, 38000);
	setTimeout(() => {
        audio.volume = audio.volume - 0.1125;
    }, 40000);
    setTimeout(() => {
        audio.volume = audio.volume - 0.1125;
    }, 42000);

	setTimeout(() => {
		diocaneelamadonna();
	}, 67600);




}


function diocaneelamadonna() {

	audio.play();



        audio.volume = 0.4;


	setTimeout(() => {
        audio.volume = audio.volume + 0.1125;
    }, 1000);

	setTimeout(() => {
        audio.volume = audio.volume + 0.1125;
    }, 2000);
    setTimeout(() => {
        audio.volume = audio.volume + 0.1125;
    }, 3000);

	setTimeout(() => {
        audio.volume = audio.volume + 0.2125;
    }, 5000);

	setTimeout(() => {
        audio.volume = audio.volume + 0.2125;
    }, 7000);
}

function stop() {
    audio.volume = 1.0;
    audio.pause();
    audio.currentTime = 0;

}

QBScoreboard.Open = function(data) {
    play()
    $("body").css({"display":"flex"});
    setTimeout(() => {
        $(".intro-text").empty();
    }, 10000);
    
}

QBScoreboard.Close = function() {
    $(".scoreboard-block").animate({"margin-right": '-=500'});
    $(".scoreboard-block").fadeOut(150);
    $(".scoreboard-block").animate({"margin-right": '+=500'});
    $("body").css({"display":"none"});
    stop()
}