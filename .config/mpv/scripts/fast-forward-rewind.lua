-- Config
local speed_original = 1.0
local speed_fast = 20.0
local delay = 0.5
local seek_jump_interval = 5
local seek_step_backward = -2
local seek_repeat_interval = 0.1

-- State
local timer_forward = nil
local timer_backward = nil
local seek_timer = nil
local fast_forwarding = false
local fast_rewinding = false

local function start_fast_forward()
    fast_forwarding = true
    mp.set_property_number("speed", speed_fast)
end

local function start_fast_rewind()
    fast_rewinding = true
    local function seek_backwards_repeatedly()
        if fast_rewinding then
            mp.command(string.format("seek %d exact", seek_step_backward))
            seek_timer = mp.add_timeout(seek_repeat_interval, seek_backwards_repeatedly)
        end
    end
    seek_backwards_repeatedly()
end

local function on_button_forward(event)
    if event.event == "down" then
        mp.command(string.format("seek %d exact", seek_jump_interval))
        fast_forwarding = false
        if timer_forward then timer_forward:kill() end
        timer_forward = mp.add_timeout(delay, start_fast_forward)
    elseif event.event == "up" then
        if timer_forward then timer_forward:kill() timer_forward = nil end
        if fast_forwarding then mp.set_property_number("speed", speed_original) end
        fast_forwarding = false
    end
end

local function on_button_back(event)
    if event.event == "down" then
        mp.command(string.format("seek -%d exact", seek_jump_interval))
        fast_rewinding = false
        if timer_backward then timer_backward:kill() end
        timer_backward = mp.add_timeout(delay, start_fast_rewind)
    elseif event.event == "up" then
        if timer_backward then timer_backward:kill() timer_backward = nil end
        if seek_timer then seek_timer:kill() seek_timer = nil end
        fast_rewinding = false
    end
end

mp.add_key_binding("MBTN_FORWARD", "forward_button_hold", on_button_forward, { complex = true })
mp.add_key_binding("MBTN_BACK", "back_button_hold", on_button_back, { complex = true })
