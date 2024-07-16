native GroupTargetOrder takes group whichGroup, string order, widget targetWidget returns boolean
native GroupTargetOrderById takes group whichGroup, integer order, widget targetWidget returns boolean
native TriggerRegisterDeathEvent takes trigger whichTrigger, widget whichWidget returns event
native GetWidgetLife takes widget whichWidget returns real
native SetWidgetLife takes widget whichWidget, real newLife returns nothing
native GetWidgetX takes widget whichWidget returns real
native GetWidgetY takes widget whichWidget returns real
native UnitDropItemTarget takes unit whichUnit, item whichItem, widget target returns boolean
native UnitUseItemTarget takes unit whichUnit, item whichItem, widget target returns boolean
native UnitDamageTarget takes unit whichUnit, widget target, real amount, boolean attack, boolean ranged, attacktype attackType, damagetype damageType, weapontype weaponType returns boolean
native IssueTargetOrder takes unit whichUnit, string order, widget targetWidget returns boolean
native IssueTargetOrderById takes unit whichUnit, integer order, widget targetWidget returns boolean
native IssueInstantPointOrder takes unit whichUnit, string order, real x, real y, widget instantTargetWidget returns boolean
native IssueInstantPointOrderById takes unit whichUnit, integer order, real x, real y, widget instantTargetWidget returns boolean
native IssueInstantTargetOrder takes unit whichUnit, string order, widget targetWidget, widget instantTargetWidget returns boolean
native IssueInstantTargetOrder takes unit whichUnit, string order, widget targetWidget, widget instantTargetWidget returns boolean
native IssueInstantTargetOrderById takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
native IssueInstantTargetOrderById takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
native IssueNeutralTargetOrder takes player whichPlayer, unit neutralStructure, string unitToBuild, widget target returns boolean
native IssueNeutralTargetOrderById takes player whichPlayer, unit neutralStructure, integer unitId, widget target returns boolean
native SaveWidgetHandle takes hashtable whichHashtable, integer parentKey, integer childKey, widget whichWidget returns boolean
native AddIndicator takes widget whichWidget, integer red, integer green, integer blue, integer alpha returns nothing
native AddSpecialEffectTarget takes string modelName, widget targetWidget, string attachPointName returns effect
native AddSpellEffectTarget takes string modelName, effecttype whichEffectType, widget targetWidget, string attachPoint returns effect
native AddSpellEffectTargetById takes integer abilCode, effecttype whichEffectType, widget targetWidget, string attachPoint returns effect
native IsAbilityBaseTargetAllowed takes integer abilCode, widget source, widget target returns boolean
native IsAbilityBaseTargetAllowed takes integer abilCode, widget source, widget target returns boolean
native IsAbilityTargetAllowed takes ability whichAbility, widget whichWidget returns boolean
native CastAbilityTarget takes ability whichAbility, widget target returns boolean
native GetWidgetSprite takes widget whichWidget returns sprite
native GetWidgetTypeId takes widget whichWidget returns integer
native GetWidgetName takes widget whichWidget returns string
native IsWidgetVisible takes widget whichWidget returns boolean
native SetWidgetVisible takes widget whichWidget, boolean visible returns nothing
native IsWidgetInvulnerable takes widget whichWidget returns boolean
native SetWidgetInvulnerable takes widget whichWidget, boolean invulnerable returns nothing
native IsWidgetTargetAllowed takes widget whichWidget, widget target, targetflag whichFlags returns boolean
native IsWidgetTargetAllowed takes widget whichWidget, widget target, targetflag whichFlags returns boolean
native GetWidgetZ takes widget whichWidget returns real
native GetWidgetPositionLoc takes widget whichWidget returns location
native SetWidgetPositionLoc takes widget whichWidget, location whichLocation returns nothing
native SetWidgetPosition takes widget whichWidget, real x, real y returns nothing
native SetWidgetPositionWithZ takes widget whichWidget, real x, real y, real z returns nothing
native SetWidgetX takes widget whichWidget, real x returns nothing
native SetWidgetY takes widget whichWidget, real y returns nothing
native SetWidgetZ takes widget whichWidget, real z returns nothing
native ResetWidgetZ takes widget whichWidget returns nothing
native GetWidgetHeight takes widget whichWidget returns real
native SetWidgetHeight takes widget whichWidget, real height returns nothing
native GetWidgetScreenX takes widget whichWidget returns real
native GetWidgetScreenY takes widget whichWidget returns real
native GetWidgetPlayerColour takes widget whichWidget returns playercolor
native SetWidgetPlayerColour takes widget whichWidget, playercolor color returns nothing
native GetWidgetVertexColour takes widget whichWidget returns integer
native SetWidgetVertexColour takes widget whichWidget, integer red, integer green, integer blue, integer alpha returns nothing
native GetWidgetTimeScale takes widget whichWidget returns real
native SetWidgetTimeScale takes widget whichWidget, real timeScale returns nothing
native GetWidgetScale takes widget whichWidget returns real
native SetWidgetScale takes widget whichWidget, real scale returns nothing
native GetWidgetFacing takes widget whichWidget returns real
native SetWidgetFacing takes widget whichWidget, real facing, boolean isInstant returns nothing
native SetWidgetMatrixScale takes widget whichWidget, real x, real y, real z returns nothing
native ResetWidgetMatrix takes widget whichWidget returns nothing
native SetWidgetOrientationEx takes widget whichWidget, real yaw, real pitch, real roll, integer eulerOrder returns nothing
native SetWidgetOrientation takes widget whichWidget, real yaw, real pitch, real roll returns nothing
native GetWidgetYaw takes widget whichWidget returns real
native SetWidgetYaw takes widget whichWidget, real yaw returns nothing
native GetWidgetPitch takes widget whichWidget returns real
native SetWidgetPitch takes widget whichWidget, real pitch returns nothing
native GetWidgetRoll takes widget whichWidget returns real
native SetWidgetRoll takes widget whichWidget, real roll returns nothing
native GetWidgetModel takes widget whichWidget returns string
native SetWidgetModel takes widget whichWidget, string modelFile returns nothing
native SetWidgetModelEx takes widget whichWidget, string modelFile, integer playerId returns nothing
native SetWidgetMaterialTexture takes widget whichWidget, string textureName, integer materialId, integer textureIndex returns nothing
native SetWidgetTexture takes widget whichWidget, string textureName, integer textureIndex returns nothing
native SetWidgetReplaceableTexture takes widget whichWidget, string textureName, integer textureIndex returns nothing
native GetWidgetModelObjectX takes widget whichWidget, string whichObject returns real
native GetWidgetModelObjectY takes widget whichWidget, string whichObject returns real
native GetWidgetModelObjectZ takes widget whichWidget, string whichObject returns real
native GetWidgetModelObjectPositionLoc takes widget whichWidget, string whichObject returns location
native GetWidgetCurrentAnimationId takes widget whichWidget returns integer
native GetWidgetCurrentAnimationName takes widget whichWidget returns string
native SetWidgetAnimationWithRarityByIndex takes widget whichWidget, integer animIndex, raritycontrol rarity returns nothing
native SetWidgetAnimationWithRarity takes widget whichWidget, string animationName, raritycontrol rarity returns nothing
native SetWidgetAnimationByIndex takes widget whichWidget, integer animIndex returns nothing
native SetWidgetAnimation takes widget whichWidget, string animationName returns nothing
native QueueWidgetAnimationByIndex takes widget whichWidget, integer animIndex returns nothing
native QueueWidgetAnimation takes widget whichWidget, string animationName returns nothing
native GetWidgetAnimationOffsetPercent takes widget whichWidget returns real
native SetWidgetAnimationOffsetPercent takes widget whichWidget, real percent returns nothing
native TriggerRegisterWidgetEvent takes trigger whichTrigger, widget whichWidget, widgetevent whichWidgetEvent returns event
native UnitAttackTarget takes unit whichUnit, widget whichTarget, boolean ignoreDistance, boolean isInstant returns nothing
native QueueTargetOrderById takes unit whichUnit, integer order, widget targetWidget returns boolean
native QueueInstantPointOrderById takes unit whichUnit, integer order, real x, real y, widget instantTargetWidget returns boolean
native QueueInstantTargetOrderById takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
native QueueInstantTargetOrderById takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
native QueueNeutralTargetOrderById takes player whichPlayer, unit neutralStructure, integer unitId, widget target returns boolean
native LaunchProjectileTarget takes projectile whichProjectile, widget whichWidget returns nothing
native SetProjectileTarget takes projectile whichProjectile, widget whichWidget returns nothing
native BlzQueueTargetOrderById takes unit whichUnit, integer order, widget targetWidget returns boolean
native BlzQueueInstantPointOrderById takes unit whichUnit, integer order, real x, real y, widget instantTargetWidget returns boolean
native BlzQueueInstantTargetOrderById takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
native BlzQueueInstantTargetOrderById takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
native BlzQueueNeutralTargetOrderById takes player whichPlayer, unit neutralStructure, integer unitId, widget target returns boolean


