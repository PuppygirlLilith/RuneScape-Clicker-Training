-- the message to be sent in the chatbox when reward is earned
local RewardMessage = "Good Puppy!"
print(RewardMessage)
-- parameters for the clicker sound to be played when a reward is earned
-- local soundParams = audio.SoundPlaybackParams.new()
-- soundParams.type = audio.SoundType.SCRIPT
-- soundParams.audioBus = audio.AudioBus.SFX
-- soundParams.numLoops = 0
-- soundParams.volume = 1.0
-- soundParams.delayTick = 0
-- soundParams.emitterShape = audio.EmitterShape.NONE

function dispenseReward(SkillTransmit)
	-- check if the triggering event resulted in an increased level, change in xp, and the initial XP was not already 200M, therefore a level up.
	if ((SkillTransmit.oldGameplayLevel < SkillTransmit.newGameplayLevel) and (SkillTransmit.oldXP ~= SkillTransmit.newXP) and (SkillTransmit.oldXP < 200000000)) then
		print("Leveled up!")
		-- check if plugin has been granted chatAccess permission before attempting to send local chat message
		print(Plugin.HasPermission(PluginPermissions.chatAccess))
		if Plugin.HasPermission(PluginPermissions.chatAccess) then
			-- sends the reward message to the local chat
			Chat.AddMessage("<col=8A2BE2>" .. RewardMessage .. "</col>")
		end
		-- play clicker sound reward
--		audio.Play(Plugin.resources.puppyClicker, soundParams)
	end
end

-- subscribe to leveling up
Event.SkillTransmit.Subscribe("levelUp", dispenseReward)
