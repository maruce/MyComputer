-- 定时自动关机
print("定时关机程序，请输入延迟时间(单位秒)：")

local function event()
	local dt = io.read();
	if not dt or dt == "" then return true end

	if string.find(dt,'[+-/\*]') then
		dt = "return "..dt
		dt = loadstring(dt)()
	end
	dt = tonumber(dt)
	if dt then
		local cmd = [[shutdown -f -s -t %d]]
		os.execute(string.format(cmd,dt))
		return true;
	else
		print("输入有误，请重新输入")
	end

end

while not event() do end
