	local Spring = { }
	Spring.__index = Spring

	local SpringStep = function(Current, Velocity, Target, Omega, Delta)
		local Offset = Current - Target
		local Decay = math.exp(-Omega * Delta)

		local NewOffset = (Offset + (Velocity + Omega * Offset) * Delta) * Decay
		local NewVelocity = (Velocity - (Velocity + Omega * Offset) * Omega * Delta) * Decay

		return Target + NewOffset, NewVelocity
	end

	function Spring.new(Value, Stiffness)
		return setmetatable({
			Value = Value,
			Velocity = 0,
			Target = Value,
			Stiffness = Stiffness,
		}, Spring)
	end

	function Spring:Set(Value, Velocity)
		self.Value = Value
		self.Velocity = Velocity or 0
		self.Target = Value
	end

	function Spring:SetTarget(Target, Kick)
		self.Target = Target

		if Kick then
			self.Velocity = Kick
		end
	end

	function Spring:Step(Delta, Stiffness)
		local Omega = Stiffness or self.Stiffness

		self.Value, self.Velocity = SpringStep(self.Value, self.Velocity, self.Target, Omega, Delta)

		return self.Value
	end

	function Spring:Settled(Epsilon)
		Epsilon = Epsilon or 0.002

		return math.abs(self.Value - self.Target) <= Epsilon and math.abs(self.Velocity) <= 0.01
	end

return Spring
