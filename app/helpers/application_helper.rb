module ApplicationHelper
  def add_fields_tag(f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render("#{association.to_s.singularize}_fields", f: builder, post: Post.new)
    end
    hidden_field_tag('', '', class: "js-add-field", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
