local status_ok, diagnostic = pcall(require, "textobj-diagnostic")
if not status_ok then
	return
end

diagnostic.setup()
