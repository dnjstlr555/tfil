
local Abilities = {}
Abilities.Skills = {}

function Abilities.Register( name, desc, icon )
	Abilities.Skills[ name ] = { desc, icon }
end

debug.getregistry().Player.HasAbility = function( self, ability )
	return SERVER and self.Ability == ability or CLIENT and self:GetNW2String("$ability") == ability
end

_G.Abilities = Abilities