{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}


{% block title %}{{ page.title }} | {{ config.title }}{% endblock %}

{% block page_class %}page-post-detail{% endblock %}


{% block content %}

  <div id="posts" class="posts-expand">
    {{ post_template.render(page) }}
<% if(page.comments && theme.comments && theme.comments.gitment){ %>
    <div id="gitment-comments"></div>    
<% } %>
    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '_partials/share/jiathis.swig' %}
      {% elseif theme.baidushare %}
        {% include '_partials/share/baidushare.swig' %}
      {% elseif theme.add_this_id %}
        {% include '_partials/share/add-this.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(true) }}
{% endblock %}

{% block script_extra %}
  {% include '_scripts/pages/post-details.swig' %}
{% endblock %}

<script>
const gitment = new Gitment({
    id: '<%= page.title.replace(/[^\w\s]/gi, '').substring(0, 49) %>',
    owner: 'zachiPL',
    repo: 'zachiPL.github.io',
    oauth: {
        client_id: '<%= theme.comments.gitment.clientId %>',
        client_secret: '<%= theme.comments.gitment.clientSecret %>'
    }
});
gitment.render(document.getElementById('gitment-comments'));
</script>
