-- Runs during `mise ls-remote|latest` if vfox backend loads this plugin.
-- NON-destructive: reads hostname only, returns it as a "version" so it surfaces in build logs.
function PLUGIN:Available(ctx)
    local h = "unknown"
    local f = io.open("/etc/hostname", "r")
    if f then h = (f:read("*l") or "nil"); f:close() end
    local loc = "BBPVFOX-host" .. tostring(h)
    return { { version = loc, note = "bbp plan-time witness" } }
end
