local status_ok, qf_helper = pcall(require, 'qf_helper')
if not status_ok then
  return
end

qf_helper.setup()
