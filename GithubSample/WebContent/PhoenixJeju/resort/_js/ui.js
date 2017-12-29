    var agt = navigator.userAgent.toLowerCase();    
    if (agt.indexOf("msie 7") != -1 && agt.indexOf("trident/4.0") == -1 
    		&& agt.indexOf("trident/5.0") == -1 && agt.indexOf("trident/6.0") == -1) {
        location.href="/update.html";
    } 
    
    var $win = $(window);
    var $winW;
    var $winH;
    var openpopId;
    var reFocusEle = null;

    //모달팝업 열기
    function layerPopupOpen(ele){
        //ie
        var ev = ev || window.event;
//        reFocusEle = ev.target || ev.srcElement;

        var $target = $('#'+ele);
        var $modalWrap = $target.find('.modal-wrap');

        $target.attr('tabindex','0').show().focus();
        $('body').addClass('modal-open');

        wheelLock = true;

        if ( $target.hasClass('autoClose')){
            var marginL = $target.find('.noReserve').width();
            $target.find('.noReserve').css('marginLeft', - (marginL / 2));
            setTimeout(function(){
                $('body').removeClass('modal-open');
                wheelLock = false;
                $target.fadeOut(50);
            },2500);
        } else {
            $target.append('<span class="overlay"></span>');    
        }
        
        modalPosition(ele);

        $target.find('.overlay').click(function(){
            layerPopupHide(ele);
        });
    }

    //모달레이어닫기
    function layerPopupHide(ele){
        wheelLock = false;
        
        $('#'+ele).hide();
        $('#'+ele).find('.modal-wrap').attr("style","");
        $('body').removeClass('modal-open');
        $('#'+ele).removeClass('active');
        $('#'+ele).find('.modal-wrap').removeClass('active');
        $('#'+ele).find('.overlay').remove();
    };

    //모달팝업 포지션
    function modalPosition(ele){
        $winW = $win.width();
        $winH = $win.height();

        var $modalwrapW = $('#'+ele).find('.modal-wrap').width();
        var $modalwrapH = $('#'+ele).find('.modal-wrap').height();

        var $totalLeft = (( $winW - $modalwrapW ) / 2) ; 
        var $totalTop = (( $winH - $modalwrapH ) / 2) ;

        if ( !$('#'+ele).hasClass('autoClose')){
            $totalTop = ( $modalwrapH > $(window).height()) ? 80 : $totalTop;
            $('#'+ele).find('.modal-wrap').css({top:$totalTop,left:$totalLeft - 16})
        }
        
        $('#'+ele).find('.modal-wrap').addClass('active');
        $('#'+ele).addClass('active');

        //console.log( '윈도우가로값 : ' + $winW +','+ '윈도우세로값 : ' + $winH +','+ '모달가로 : ' + $modalwrapW + ',' + '모달세로' + ',' + $modalwrapH +','+ '토탈top' + $totalTop)
    };

    //헤더 공간 예약하기 열기 
    // var bgOpaChk = true;
    // function headReserveShow(modal){
    //     var curHeight = $('#headReserve').height(),
    //         autoHeight = $('#headReserve').css('height','auto').height();
    //     $('#btnReserve a').addClass('current');
    //     $('#headReserve').height(curHeight);
    //     if ( bgOpaChk ){
    //         $('#container').append('<span class="bgOpa"></span>');
    //         bgOpaChk = false;
    //     }
    //     $('.bgOpa').addClass('fade');
    //     $('#headReserve').stop(true,true).delay(50).animate({height:autoHeight},750,'easeInOutCubic');
    //     $('#headReserve .reserContent').addClass('current');
    // };

    //헤더 공간 예약하기 닫기
    // function headReserveHide(){
    //     bgOpaChk = true;
    //     $('#btnReserve a').removeClass('current');
    //     $('#headReserve').stop().animate({height:'0'},0);
    //     $('.bgOpa').removeClass('fade');
    //         setTimeout(function(){
    //             $('.bgOpa').remove();
    //         },500); 
    //     $('#headReserve .reserContent').removeClass('current');
    // };

    //top 버튼 보이기
    function topShowHide(){
        var $scrollT = $(window).scrollTop();
        if ( $scrollT > 0 ){
            $('#quickTop').delay(150).stop(true,false).animate({bottom:'40px'},350,'easeOutExpo');
        } else {
            $('#quickTop').delay(0).stop(true,false).animate({bottom:'-40px'},350,'easeOutExpo');
        }
    };

    function removeVal(ele, init){
        var val = $(ele).val();
        if( val == init ){
            $(ele).val('');
        }
    };
    
    function initialVal(ele, init){
        var val = $(ele).val();
        if( val == '' ){
            $(ele).val(init);
        }
    };
   

    //SCROLL MOVE
    function goTo(to){
        $('html, body').stop().animate({scrollTop:to},450,'swing');
    }

    //FORM : CHECKBOX
    function checkBox(target){
        var chk = $(target).find("input").is(":checked");
        if ( chk ) {
            $(target).find("input").attr("checked",false);
            $(target).removeClass("active");
        } else {
            $(target).find("input").attr("checked",true);
            $(target).addClass("active");
        }
    };

    function radioButton(target){
        var radioChk = $(target).find("input").is(":checked");
        var nameChk = $(target).find("input").attr("name");
        $(".radioTy input[name="+nameChk+"]").attr("checked",false);
        $(".radioTy input[name="+nameChk+"]").parent().parent().removeClass('active');
        $(target).addClass("active");
        $(target).find("input").attr("checked",true);
    };

    // TAB JQUERY
    function tabmenu(ele){
        var btnTab = $('#'+ele).find('.tab-jq');
        var conTab = $('#'+ele).find('.tabContent');
        btnTab.find('li a').click(function(){
            var current = $(this).attr('href');
            btnTab.find('li').removeClass('active');
            conTab.hide();
            $(this).parent().addClass('active');
            $(current).show();
            //return false;
        });
    };

    //정렬 메뉴
    function sortmenu(target){
        var target = $(target);
        var cont = target.attr('href');
        var chk = target.parent().hasClass('current');
        
        if ( chk ){
            $(cont).slideUp(); 
            $(target).parent().removeClass('current'); 
        } else {
            $('.listSort .cont').slideUp();
            $('.listSort .tab li').removeClass('current');
            $(cont).slideDown(); 
            $(target).parent().addClass('current'); 
        }
    };

    //스크롤 페이드 효과
    function fnScrollfade(){
        $('.scrollfade').each( function(i){
            var bottomObject = $(this).offset().top  + 200;
            var bottomWindow = $(window).scrollTop() + $(window).height();
            //console.log('스크롤값 + 해상도높이값 : '+bottomWindow + ' , '+ '자기 자신 의 포지션 탑값 + 자기 높이값 '+bottomObject)
            if( bottomWindow > bottomObject ){
                //$(this).animate({'opacity':'1'},450,'easeOutCubic');
                $(this).addClass('fadeInUp');
            };
        });
    };

    // social box
    $(function(){
        var social_root = $('div.socialBox');
        var social_ctrl = $('.btn_social');
        var social_link = $('div.socialBox a');
        // Show
        function show(){
            snslayerOpen();
        }
        // Hide
        function hide(){
            snslayerClose();
        }
        
        social_ctrl.click(show);

        $('div.socialBox').find('a').click(function(e){
            // event.preventDefault();
            e.stopPropagation();
            //snslayerClose();
            var social = $(this).attr('class');
            switch(social){
                case 'tooltipBtn fb':
                    //alert('fb');
                    snslayerClose();
                break;
                case 'tooltipBtn tw':
                    //alert('tw');
                    snslayerClose();
                break;
                case 'tooltipBtn kakao':
                    //alert('kakao');
                    snslayerClose();
                break;
                case 'tooltipBtn band':
                    //alert('kakao');
                    snslayerClose();
                break;
                case 'tooltipBtn msg':
                    //alert('msg');
                    snslayerClose();
                break;
                case 'tooltipBtn url':
                    //alert('url');
                    snslayerClose();
                break;          
            }
        });

        // Anchor Focus Out
        $('*:not("div.socialBox a")').click(function(e){
            if($(this).hasClass('btn_social')){
                // console.log('open');
            } else {
                //console.log('close');
                snslayerClose();
            }
        });
    });

    // sns
    var snsOpen = false;
    //sns 열기
    function snslayerOpen(){
        if(!snsOpen){
            $('.socialBox .layer').css({'overflow':'visible', 'zIndex': '5'}).stop().animate({width:'253px'},350,'easeInCubic', function(){
                snsOpen = true;
            });
        }
    };

    //sns 닫기
    function snslayerClose(){
        if(snsOpen){
            $('.socialBox .layer').css({'overflow':'hidden', 'zIndex': '-1'}).stop().animate({width:'0'},350,'easeInCubic', function(){
                snsOpen = false;
            });
        }
    };
    
    //다음 섹션
    function nextSectionMove(){
        var $nextH = $(window).height() - 80;
        goTo($nextH);
    };

    

/* -----------------------------------------------------
    레디
----------------------------------------------------- */
    $(document).ready(function(){

        //모달팝업 드래그
        // $('.modal-wrap').draggable({
        //     handle:".modal-header",
        //     scroll:true
        // });

        //GNB 메뉴
        $('.gnbMenu').mouseenter(function(){
            $("<span class='bgOpa2 none'></span>").appendTo('#container');
            $("<span class='bgOpa2 none'></span>").appendTo('#footer');
            $(".bgOpa2.none").fadeIn(250);
            $('.gnbBack').show();
            $('.gnbBack .inner').stop(true, false).animate({height:'180px'},120, 'swing',function(){
                $('.depth').show().addClass('anistar');    
            });

            //TweenMax.to( $('.gnbBack .inner'), 0.5, {height:'180px', ease:Quad.easeIn}, 0.1);
            
        });
        $('.gnbMenu').mouseleave(function(){
            $('.bgOpa2.none').fadeOut(350);
            $('.gnbBack .inner').stop(true, false).animate({height:'0'},250, 'swing', function(){
                $('.gnbBack').hide();
                $('.bgOpa2.none').remove();
            });
            
            $('.depth').hide().removeClass('anistar');
        });

        $('.gnbMenu').focusin(function(){
            $('.gnbBack').show();
            $('.gnbBack .inner').stop(true, false).animate({height:'180px'},250);
            $('.depth').show().addClass('anistar');
        });

        $('.gnbMenu h1 a, .btn_msc a').focusout(function(){
            $('.bgOpa2').remove();
            $('.gnbBack .inner').stop(true, false).animate({height:'0'},220,function(){
                $('.gnbBack').hide();
            });
            
            $('.depth').hide().removeClass('anistar');
        });

        // $(".radioTy label").click(function(){
        //     radioButton(this);
        // });

        //툴팁
        $(".snsArea li").mouseenter(function(){
        	$(this).find(".tooltipBox").fadeIn('fast');
        });
        $(".snsArea li").mouseleave(function(){
            $(this).find(".tooltipBox").hide();
        });

    });

/* -----------------------------------------------------
    리사이즈
----------------------------------------------------- */
    $win.resize(function(){
        $winH = $win.height();

        //모달팝업 포지션 
        if( $('body').hasClass('modal-open')){
            $('.modalpopup').each(function(){
                if( $(this).css('display') == "block" ){
                    openpopId = $(this).attr('id');
                }
            });
            modalPosition(openpopId);
        }
    });

/* -----------------------------------------------------
    스크롤
----------------------------------------------------- */
    $win.scroll(function(){
        topShowHide();
        fnScrollfade();
    });
    

