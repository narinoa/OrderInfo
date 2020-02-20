Global("localization", nil)

Global("Locales", {
	["rus"] = { -- Russian, Win-1251
    ["Text"] = "Бафы ордена сегодня",
    ["DateEnd"] = "Дней до конца сезона",
    ["VoteTrue"] = "Можно отдать голос за дары",
    ["VoteFalse"] = "Голосование завершено",
    ["Alarm"] = "НЕ ЗАБУДЬТЕ КУПИТЬ НАГРАДЫ!",
    ["Weight"] = "Ваш вес голоса: ",
    ["VoteButton"] = "Проголосовать за бафы",
    ["BT"] = "Бафы на завтра:",
	},
		
	["eng_eu"] = { -- English, Latin-1
    ["Text"] = "Order buffs today",
    ["DateEnd"] = "Days until the end",
    ["VoteTrue"] = "Can vote for buffs",
    ["VoteFalse"] = "You voted already",
	["Alarm"] = "DON`T FORGET TO BUY REWARDS!",
	["Weight"] = "Your vote weight: ",
	["VoteButton"] = "Vote for buffs",
	["BT"] = "Buffs tomorrow",
	}
})

--We can now use an official method to get the client language
localization = common.GetLocalization()
function GTL( strTextName )
	return Locales[ localization ][ strTextName ] or Locales[ "eng_eu" ][ strTextName ] or strTextName
end
