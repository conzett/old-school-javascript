module ApplicationHelper
  def replace_with(id, content)
  end

  def undo_destroy_path(model)
    name = model.model_name.singular
    params = [[name, { destroyed_at: nil }]].to_h
    polymorphic_path("destroyed_#{name}", params)
  end

  # TODO: Complete this 🤷
  def disable_test
    'console.log("test")'
  end

  # TODO: Use Rails UJS setData/expando to stash original state 😎 
  def show(model)
    raw "document.getElementById('#{model.html_id}').style.display = 'table-row'"
  end

  def hide(model)
    raw "document.getElementById('#{model.html_id}').style.display = 'none'"
  end

  def render_flash(partial: 'application/flash_notice', **locals)
    html = j render partial: partial, locals: locals
    raw "document.getElementById('flash').innerHTML = '#{html}'"
  end
end
