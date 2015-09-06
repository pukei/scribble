json.array!(@scribbles) do |scribble|
  json.extract! scribble, :id, :title, :content, :on
  json.url scribble_url(scribble, format: :json)
end
