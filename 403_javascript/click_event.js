
var index = 0;
$(function() {
    /* click 切り替えサンプル http://www.finefinefine.jp/web/kiji422/ */
    $("#click_event").click( function() {
        $(".contentInner").addClass('display_off');
        index++;
        index&=0x01;
        $(".contentInner").eq(index).removeClass('display_off');
        if( index ) {
            $(this).removeClass('released');
            $(this).addClass('pressed');
        }
        else{
            $(this).removeClass('pressed');
            $(this).addClass('released');
        }
    } );
    
    /* スクロールの実験 */
    var scrollValue = 0;
    /* スクロールイベント */
    var scroll = function(){
        var scroll_now = $(".contentInner").eq(index).scrollTop();
        $(".contentInner").eq(index).scrollTop(scroll_now+scrollValue);
        setTimeout(scroll,1);
    }
    /* マウスイベント */
    $(".fixed").mousedown( function() {
        /* マウス押す (押しっぱでも１回しかこないぞ */
        var num = $(".fixed").index(this);
        num &= 0x01;
        if( num == 0 ){
            scrollValue = -1;
        }
        else{
            scrollValue = 1;
        }
        setTimeout(scroll, 1);
    }).mouseup( function() {
        /* マウスボタン押すのやめ */
        scrollValue = 0;
        clearTimeout(scroll);
    }).mouseleave( function() {
        /* フォーカス外れた */
        scrollValue = 0;
        clearTimeout(scroll);
    });
} );








