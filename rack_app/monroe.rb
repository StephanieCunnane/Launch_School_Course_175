class Monroe
  def erb(filename, local={})
    message = local[:message]
    template = File.read("views/#{filename}.erb")
    ERB.new(template).result(binding)
  end

  def response(status, headers, body='')
    body = yield if block_given?
    [status, headers, [body]]
  end
end
