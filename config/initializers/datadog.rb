Datadog.configure do |c|
  # This will activate auto-instrumentation for Rails
  c.use :rails
  c.use :action_cable, options
end
