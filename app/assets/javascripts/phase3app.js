$(function() {
    var value = sessionStorage.nvft;
    if (!value) { //valueに何も入っていなかったら
        sessionStorage.nvft = 1;
$(".mn-012").prepend(
'<section class="nvft001 nvft002"><div class="nvft011"><span id="close-btn" class="nvft021">x 閉じる</span><div class="nvft022"><span class="nvft032"><div class="nvft041">サイトにログイン</div><div class="nvft042">投稿したり、お気に入りの写真を見つけよう。</div></span><span class="nvft033"><a href="/sessions/new"><span class="nvft051 nvft052"><button class="nvft061 nvft062 nvft063 nvft064">ログイン</button></span></a><a href="/users/new"><span class="nvft053 nvft052"><button class="nvft061 nvft065 nvft063 nvft064">登録</button></span></a></span></div></div></section>'
);
    }

    $('#close-btn').click(function () {
        $('section.nvft001.nvft002').remove();
    });

    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
          $('.nv-021').addClass('nv-022');
          $('.nv-031').addClass('nv-032');
          $('.navbar-brand').css('color','#fff');
        } else {
          $('.nv-021').removeClass('nv-022');
          $('.nv-031').removeClass('nv-032');
          $('.navbar-brand').css('color','#212529');
        }
    });
})
;

