{% if page.comments %}

  {% if theme.facebook_sdk.enable and theme.facebook_comments_plugin.enable %}
    <div class="comments" id="comments">
      <div class="fb-comments"
           data-href="{{ page.permalink }}"
           data-numposts="{{ theme.facebook_comments_plugin.num_of_posts }}"
           data-width="{{ theme.facebook_comments_plugin.width }}"
           data-colorscheme="{{ theme.facebook_comments_plugin.scheme }}">
      </div>
    </div>

  {% elseif theme.vkontakte_api.enable and theme.vkontakte_api.comments %}
    <div class="comments" id="comments">
      <div id="vk_comments"></div>
    </div>

  {% elseif theme.disqus.enable %}
    <div class="comments" id="comments">
      <div id="disqus_thread">
        <noscript>
          Please enable JavaScript to view the
          <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a>
        </noscript>
      </div>
    </div>

  {% elseif theme.hypercomments_id %}
    <div class="comments" id="comments">
      <div id="hypercomments_widget"></div>
    </div>

  {% elseif theme.youyan_uid %}
    <div class="comments" id="comments">
      <div id="uyan_frame"></div>
    </div>

  {% elseif theme.livere_uid %}
    <div class="comments" id="comments">
      <div id="lv-container" data-id="city" data-uid="{{ theme.livere_uid }}"></div>
    </div>

  {% elseif theme.changyan.enable and theme.changyan.appid and theme.changyan.appkey %}
    <div class="comments" id="comments">
      <div id="SOHUCS"></div>
    </div>

  {% elseif theme.gitment.enable %}
    <div class="comments" id="comments">
      {% if theme.gitment.lazy %}
        <div onclick="showGitment()" id="gitment-display-button">{{ __('gitmentbutton') }}</div>
        <div id="gitment-container" style="display:none"></div>
      {% else %}
        <div id="gitment-container"></div>
      {% endif %}
    </div>

  {% elseif theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
    <div class="comments" id="comments">
    </div>
  {% endif %}
{% elseif theme.changyan.appid and theme.changyan.appkey %}
<div id="SOHUCS"></div>
{% elseif theme.gitment.enable %}
<div onclick="showGitment()" id="gitment_title" class="gitment_title">显示 Gitment 评论</div>
<div id="container" style="display:none"></div>
<link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
<script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
<script>
const myTheme = {
render(state, instance) {
const container = document.createElement('div');
container.lang = "en-US";
container.className = 'gitment-container gitment-root-container';
container.appendChild(instance.renderHeader(state, instance));
container.appendChild(instance.renderEditor(state, instance));
container.appendChild(instance.renderComments(state, instance));
container.appendChild(instance.renderFooter(state, instance));
return container;
}
}
function showGitment() {
$("#gitment_title").attr("style", "display:none");
$("#container").attr("style", "").addClass("gitment_container");
var gitment = new Gitment({
id: window.location.pathname,
theme: myTheme,
owner: '{{ theme.gitment.owner }}',
repo: '{{ theme.gitment.repo }}',
oauth: {
client_id: '{{ 9f9e2b44f8bbac59126c23ecff81d3facc27379ff7a73a81187a4bcd1d41d8cf }}',
client_secret: '{{ 9cebfdbdd37a5ea38cf3538d070d9f2677f1cec165a0606aeecb326ce617626d }}'
}
});
gitment.render('container');
}
</script>
{% endif %}
{% endif %}
