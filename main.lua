-- the message to be sent in the chatbox when reward is earned
local RewardMessage = "Good Puppy!"

-- parameters for the clicker sound to be played when a reward is earned
local soundParams = audio.SoundPlaybackParams.new()
soundParams.type = audio.SoundType.SCRIPT
soundParams.audioBus = audio.AudioBus.SFX
soundParams.numLoops = 0
soundParams.volume = 1.0
soundParams.delayTick = 0
soundParams.emitterShape = audio.EmitterShape.NONE

function dispenseReward(SkillTransmit)
	-- check if the triggering event was a level up
	if (SkillTransmit.oldGameplayLevel < SkillTransmit.newGameplayLevel) then
		-- check if plugin has been granted chatAccess permission before attempting to send local chat message
		if Plugin.HasPermission(PluginPermissions.chatAccess) then
			-- sends the reward message to the local chat
			Chat.AddMessage(RewardMessage)
		end
		-- play clicker sound reward
		audio.Play(Plugin.resources.puppyClicker, soundParams)
	end
end

-- subscribe to leveling up
Event.SkillTransmit.Subscribe("levelUp", dispenseReward)
