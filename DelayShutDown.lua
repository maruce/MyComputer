-- ��ʱ�Զ��ػ�
print("��ʱ�ػ������������ӳ�ʱ��(��λ��)��")

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
		print("������������������")
	end

end

while not event() do end
