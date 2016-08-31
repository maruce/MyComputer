-- 定时自动关闭播放器
print("定时关闭音乐播放器wmplayer.exe")
function event()
	print("请输入关闭时间:")
	local input = io.read();
	if not input or input == "" then return true end

	if string.find(input,'[+-/\*]') then
		input = "return "..input
		input = loadstring(input)()
	end

	local dt = tonumber(input)
	if dt then
		dt = os.time() + dt
		local sd = os.date("%Y/%m/%d",dt);
		local st = os.date("%H:%M:%S",dt);
		-- print(sd,st)
		local cmd = [[schtasks /f /create /tn deleteCloseWMPlayer /tr "taskkill /f /im wmplayer.exe" /sc once /st %s /sd %s]]
		cmd = string.format(cmd,st,sd)
		print(cmd)
		os.execute(cmd);
		os.execute("pause");
		return true;
	else
		print("输入有误，请重新输入!!")
	end
end

while not event() do end
