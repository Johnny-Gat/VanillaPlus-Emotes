local DB = {
	{e="applaud",
		{k="^You applaud.  Bravo!$",v="Вы аплодируете. Браво!"},
		{k="^You applaud at (.+).  Bravo!$",v="Вы рукоплещете %s. Браво!"},
		{k="^(.+) applauds.  Bravo!$",v="%s хлопает в ладоши. Браво!"},
		{k="^(.+) applauds at you.  Bravo!$",v="%s рукоплещет вам. Браво!"},
		{k="^(.+) applauds at (.+).  Bravo!$",v="%s рукоплещет %s. Браво!"}},
}

local r
local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
f:SetScript("OnEvent", function()
	for i=1, table.getn(DB) do
		if string.find(arg1, DB[i].e) then
			for j=1, table.getn(DB[i]) do
				r = {string.find(arg1, DB[i][j].k)}
				if r[1] then
					DEFAULT_CHAT_FRAME:AddMessage(string.format(DB[i][j].v, (r[3] or ""), (r[4] or "")))
					return
				end
			end
		end
	end
end)
