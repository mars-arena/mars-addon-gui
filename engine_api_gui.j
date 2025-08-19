	//===================================
	//=========== AREA SPELLS ===========
	type AreaSpell extends integer

	//=============================
	//=========== AURAS ===========
	type Aura extends integer

	//=============================
	//=========== BUFFS ===========
	type Buff extends integer

	//==============================
	//=========== EVENTS ===========
	type Event extends integer

	//=================================
	//=========== ILLUSIONS ===========

	// Instance Structure
	type Illusion extends integer

	//==========================================
	//=========== STATIC PROJECTILES ===========
	type StaticProjectile extends integer


globals
	//====================================
	//=========== ATTACK SPEED ===========

	// Событие модификатора скорости боя
	//
	// GetASUnit() -> unit
	// GetASBonus() -> real
	// GetASPenalty() -> real
	// GetASIncrease() -> real
	// GetASDecrease() -> real
	// AddASBonus(real asBonus)
	// AddASPenalty(real asPenalty)
	// AddASIncrease(real asIncrease)
	// AddASDecrease(real asDecrease)
	// SetASBonus(real asBonus)
	// SetASPenalty(real asPenalty)
	// SetASIncrease(real asIncrease)
	// SetASDecrease(real asDecrease)
	constant Event EVENT_ATTACK_SPEED = undefined

	//=============================
	//=========== AURAS ===========

	// Событие ауры
	//
	// GetAuraOwnerUnit() -> unit
	// GetAuraTargetUnit() -> unit
	// IsAuraEntered() -> boolean
	// IsAuraOut() -> boolean
	// IsAuraActions() -> boolean
	// GetAuraActionsId() -> integer
	constant Event EVENT_AURA = undefined

	//=============================
	//=========== BUFFS ===========

	// Событие баффа
	//
	// GetTriggerBuffOwner() -> unit
	// GetTriggerBuffTarget() -> unit
	// GetTriggerBuffIsEntered() -> boolean
	// GetTriggerBuffIsOut() -> boolean
	// GetTriggerBuffIsActions() -> boolean
	// GetTriggerBuffIsTransfer() -> boolean
	// GetTriggerBuffActionsId() -> integer
	// GetTriggerBuffId() -> integer
	// GetTriggerBuffStack() -> timer
	constant Event EVENT_BUFF = undefined

	//==============================
	//=========== COMBAT ===========

	// Событие при входе или выходе юнита из боя
	//
	// GetCombatUnit() -> unit
	// IsCombatEntering() -> boolean
	// IsCombatLeaving() -> boolean
	constant Event EVENT_COMBAT = undefined

	//==============================
	//=========== DAMAGE ===========

	// @const типы мультипликаторов текста
	constant integer ATTACK_AMPLIFIER = 1
	constant integer SIMPLE_AMPLIFIER = 2
	constant integer DAMAGE_MULTIPLIER = 3

	// Событие модификатора уворота
	//
	// AddModifierDodgeChance(real dodgeChance)
	// AddModifierMissChance(real missChance)
	// AddModifierTrueStrikeChance(real trueStrikeChance)
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// GetModifierDodgeChance() -> real
	// GetModifierMissChance() -> real
	// GetModifierTrueStrikeChance() -> real
	// IsModifierAttack() -> boolean
	// SetModifierDodgeChance(real dodgeChance)
	// SetModifierMissChance(real missChance)
	// SetModifierTrueStrikeChance(real trueStrikeChance)
	constant Event EVENT_DODGE_MODIFIER = undefined

	// Событие предществующего модификатора урона
	//
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// IsModifierAttack() -> boolean
	// IsModifierIgnoreBlock() -> boolean
	// IsModifierMagical() -> boolean
	// IsModifierNoRepeat() -> boolean
	// IsModifierPhysical() -> boolean
	// IsModifierPure() -> boolean
	// IsModifierReflection() -> boolean
	// IsModifierSimulate() -> boolean
	// IsModifierSpecAttack() -> boolean
	//
	// AddModifierPierceRate(real pierceRate)
	// GetModifierPierceRate() -> real
	// SetModifierPierceRate(real pierceRate)
	// SetModifierPierceType(integer pierceType)
	//
	// AddModifierDMGAdd(real dmgAdd)
	// GetModifierDMGAdd() -> real
	// SetModifierDMGAdd(real dmgAdd)
	//
	// AddModifierDMGAmplifier(integer typeAmplifier, real dmgAmplifier)
	// GetModifierDMGAmplifier(integer typeAmplifier) -> real
	// SetModifierDMGAmplifier(integer typeAmplifier, real dmgAmplifier)
	constant Event EVENT_PRECEDING_MODIFIER = undefined

	// Событие уникальных модификаторов (работает один из)
	//
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// IsModifierAttack() -> boolean
	// IsModifierIgnoreBlock() -> boolean
	// IsModifierMagical() -> boolean
	// IsModifierNoRepeat() -> boolean
	// IsModifierPhysical() -> boolean
	// IsModifierPure() -> boolean
	// IsModifierReflection() -> boolean
	// IsModifierSimulate() -> boolean
	// IsModifierSpecAttack() -> boolean
	//
	// AddModifierBash(integer typeId, real bashDamage, real duration)
	// AddModifierCriticalDamage(integer typeId, real criticalDamage)
	// AddModifierCriticalRate(integer typeId, real criticalRate)
	// GetModifierCriticalType() -> integer
	// PlusModifierCriticalRate(real criticalRate)
	constant Event EVENT_UNIQUE_MODIFIER = undefined

	// Событие пост модификатора урона
	//
	// GetModifierAttackedUnit() -> unit
	// GetModifierAttackingUnit() -> unit
	// IsModifierAttack() -> boolean
	// IsModifierCritical() -> boolean
	// IsModifierDodge() -> boolean
	// IsModifierIgnoreBlock() -> boolean
	// IsModifierMagical() -> boolean
	// IsModifierNoRepeat() -> boolean
	// IsModifierPhysical() -> boolean
	// IsModifierPure() -> boolean
	// IsModifierReflection() -> boolean
	// IsModifierSimulate() -> boolean
	// IsModifierSpecAttack() -> boolean
	//
	// GetBlockedFromAmount(real amount) -> real
	//
	// GetModifierDamageGiven() -> real
	// SetModifierDamageGiven(real dmgGiven)
	//
	// GetModifierDamageTaken() -> real
	// SetModifierDamageTaken(real dmgTaken)
	//
	// GetModifierDamageMax() -> real
	// SetModifierDamageMax(real dmgMax)
	//
	// GetModifierArmorReduction();
	constant Event EVENT_POST_MODIFIER_INDEX_DAMAGE = undefined
	constant Event EVENT_POST_MODIFIER_INDEX_PERCENT = undefined
	constant Event EVENT_POST_MODIFIER_INDEX_AMOUNT = undefined
	constant Event EVENT_POST_MODIFIER_INDEX_PASS = undefined

	// Событие любого урона
	//
	// GetDamageAttackedUnit() -> unit
	// GetDamageAttackingUnit() -> unit
	// GetDamageBash() -> real
	// GetDamageBashDuration() -> real
	// GetDamageBlocked() -> real
	// GetDamageGiven() -> real
	// GetDamageIgnoreBlock() -> boolean
	// GetDamageIsAttack() -> boolean
	// GetDamageIsBlocked() -> boolean
	// GetDamageIsCritical() -> boolean
	// GetDamageIsDodge() -> boolean
	// GetDamageIsMagical() -> boolean
	// GetDamageIsNoRepeat() -> boolean
	// GetDamageIsPhysical() -> boolean
	// GetDamageIsPure() -> boolean
	// GetDamageIsReflection() -> boolean
	// GetDamageIsSimulate() -> boolean
	// GetDamageIsSpecAttack() -> boolean
	// GetDamageLifeAttackedUnit() -> real
	constant Event EVENT_DAMAGE = undefined

	// Событие смерти юнита
	//
	// GetDeathKillingUnit() -> unit
	// GetDeathKilledUnit() -> unit
	constant Event EVENT_DEATH = undefined

	//==============================
	//=========== EVENTS ===========
	constant Event EVENT_NATIVE_GAME_VICTORY = GetHandleId(EVENT_GAME_VICTORY)
	constant Event EVENT_NATIVE_GAME_END_LEVEL = GetHandleId(EVENT_GAME_END_LEVEL)
	constant Event EVENT_NATIVE_GAME_STATE_LIMIT = GetHandleId(EVENT_GAME_STATE_LIMIT)
	constant Event EVENT_NATIVE_GAME_TIMER_EXPIRED = GetHandleId(EVENT_GAME_TIMER_EXPIRED)
	constant Event EVENT_NATIVE_GAME_ENTER_REGION = GetHandleId(EVENT_GAME_ENTER_REGION)
	constant Event EVENT_NATIVE_GAME_LEAVE_REGION = GetHandleId(EVENT_GAME_LEAVE_REGION)
	constant Event EVENT_NATIVE_GAME_TRACKABLE_HIT = GetHandleId(EVENT_GAME_TRACKABLE_HIT)
	constant Event EVENT_NATIVE_GAME_TRACKABLE_TRACK = GetHandleId(EVENT_GAME_TRACKABLE_TRACK)
	constant Event EVENT_NATIVE_GAME_SHOW_SKILL = GetHandleId(EVENT_GAME_SHOW_SKILL)
	constant Event EVENT_NATIVE_GAME_BUILD_SUBMENU = GetHandleId(EVENT_GAME_BUILD_SUBMENU)
	constant Event EVENT_NATIVE_ALLIANCE_CHANGED = GetHandleId(EVENT_PLAYER_ALLIANCE_CHANGED)
	constant Event EVENT_NATIVE_DEFEAT = GetHandleId(EVENT_PLAYER_DEFEAT)
	constant Event EVENT_NATIVE_VICTORY = GetHandleId(EVENT_PLAYER_VICTORY)
	constant Event EVENT_NATIVE_LEAVE = GetHandleId(EVENT_PLAYER_LEAVE)
	constant Event EVENT_NATIVE_END_CINEMATIC = GetHandleId(EVENT_PLAYER_END_CINEMATIC)
	constant Event EVENT_NATIVE_UNIT_ATTACKED = GetHandleId(EVENT_PLAYER_UNIT_ATTACKED)
	constant Event EVENT_NATIVE_UNIT_RESCUED = GetHandleId(EVENT_PLAYER_UNIT_RESCUED)
	constant Event EVENT_NATIVE_UNIT_DEATH = GetHandleId(EVENT_PLAYER_UNIT_DEATH)
	constant Event EVENT_NATIVE_UNIT_DECAY = GetHandleId(EVENT_PLAYER_UNIT_DECAY)
	constant Event EVENT_NATIVE_UNIT_DETECTED = GetHandleId(EVENT_PLAYER_UNIT_DETECTED)
	constant Event EVENT_NATIVE_UNIT_HIDDEN = GetHandleId(EVENT_PLAYER_UNIT_HIDDEN)
	constant Event EVENT_NATIVE_UNIT_SELECTED = GetHandleId(EVENT_PLAYER_UNIT_SELECTED)
	constant Event EVENT_NATIVE_UNIT_DESELECTED = GetHandleId(EVENT_PLAYER_UNIT_DESELECTED)
	constant Event EVENT_NATIVE_UNIT_CONSTRUCT_START = GetHandleId(EVENT_PLAYER_UNIT_CONSTRUCT_START)
	constant Event EVENT_NATIVE_UNIT_CONSTRUCT_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
	constant Event EVENT_NATIVE_UNIT_CONSTRUCT_FINISH = GetHandleId(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
	constant Event EVENT_NATIVE_UNIT_UPGRADE_START = GetHandleId(EVENT_PLAYER_UNIT_UPGRADE_START)
	constant Event EVENT_NATIVE_UNIT_UPGRADE_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_UPGRADE_CANCEL)
	constant Event EVENT_NATIVE_UNIT_UPGRADE_FINISH = GetHandleId(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	constant Event EVENT_NATIVE_UNIT_TRAIN_START = GetHandleId(EVENT_PLAYER_UNIT_TRAIN_START)
	constant Event EVENT_NATIVE_UNIT_TRAIN_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_TRAIN_CANCEL)
	constant Event EVENT_NATIVE_UNIT_TRAIN_FINISH = GetHandleId(EVENT_PLAYER_UNIT_TRAIN_FINISH)
	constant Event EVENT_NATIVE_UNIT_RESEARCH_START = GetHandleId(EVENT_PLAYER_UNIT_RESEARCH_START)
	constant Event EVENT_NATIVE_UNIT_RESEARCH_CANCEL = GetHandleId(EVENT_PLAYER_UNIT_RESEARCH_CANCEL)
	constant Event EVENT_NATIVE_UNIT_RESEARCH_FINISH = GetHandleId(EVENT_PLAYER_UNIT_RESEARCH_FINISH)
	constant Event EVENT_NATIVE_UNIT_ISSUED_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_ORDER)
	constant Event EVENT_NATIVE_UNIT_ISSUED_POINT_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
	constant Event EVENT_NATIVE_UNIT_ISSUED_TARGET_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
	constant Event EVENT_NATIVE_UNIT_ISSUED_UNIT_ORDER = GetHandleId(EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER)
	constant Event EVENT_NATIVE_HERO_LEVEL = GetHandleId(EVENT_PLAYER_HERO_LEVEL)
	constant Event EVENT_NATIVE_HERO_SKILL = GetHandleId(EVENT_PLAYER_HERO_SKILL)
	constant Event EVENT_NATIVE_HERO_REVIVABLE = GetHandleId(EVENT_PLAYER_HERO_REVIVABLE)
	constant Event EVENT_NATIVE_HERO_REVIVE_START = GetHandleId(EVENT_PLAYER_HERO_REVIVE_START)
	constant Event EVENT_NATIVE_HERO_REVIVE_CANCEL = GetHandleId(EVENT_PLAYER_HERO_REVIVE_CANCEL)
	constant Event EVENT_NATIVE_HERO_REVIVE_FINISH = GetHandleId(EVENT_PLAYER_HERO_REVIVE_FINISH)
	constant Event EVENT_NATIVE_UNIT_SUMMON = GetHandleId(EVENT_PLAYER_UNIT_SUMMON)
	constant Event EVENT_NATIVE_UNIT_DROP_ITEM = GetHandleId(EVENT_PLAYER_UNIT_DROP_ITEM)
	constant Event EVENT_NATIVE_UNIT_PICKUP_ITEM = GetHandleId(EVENT_PLAYER_UNIT_PICKUP_ITEM)
	constant Event EVENT_NATIVE_UNIT_USE_ITEM = GetHandleId(EVENT_PLAYER_UNIT_USE_ITEM)
	constant Event EVENT_NATIVE_UNIT_LOADED = GetHandleId(EVENT_PLAYER_UNIT_LOADED)
	constant Event EVENT_NATIVE_GAME_LOADED = GetHandleId(EVENT_GAME_LOADED)
	constant Event EVENT_NATIVE_GAME_TOURNAMENT_FINISH_SOON = GetHandleId(EVENT_GAME_TOURNAMENT_FINISH_SOON)
	constant Event EVENT_NATIVE_GAME_TOURNAMENT_FINISH_NOW = GetHandleId(EVENT_GAME_TOURNAMENT_FINISH_NOW)
	constant Event EVENT_NATIVE_GAME_SAVE = GetHandleId(EVENT_GAME_SAVE)
	constant Event EVENT_NATIVE_ARROW_LEFT_DOWN = GetHandleId(EVENT_PLAYER_ARROW_LEFT_DOWN)
	constant Event EVENT_NATIVE_ARROW_LEFT_UP = GetHandleId(EVENT_PLAYER_ARROW_LEFT_UP)
	constant Event EVENT_NATIVE_ARROW_RIGHT_DOWN = GetHandleId(EVENT_PLAYER_ARROW_RIGHT_DOWN)
	constant Event EVENT_NATIVE_ARROW_RIGHT_UP = GetHandleId(EVENT_PLAYER_ARROW_RIGHT_UP)
	constant Event EVENT_NATIVE_ARROW_DOWN_DOWN = GetHandleId(EVENT_PLAYER_ARROW_DOWN_DOWN)
	constant Event EVENT_NATIVE_ARROW_DOWN_UP = GetHandleId(EVENT_PLAYER_ARROW_DOWN_UP)
	constant Event EVENT_NATIVE_ARROW_UP_DOWN = GetHandleId(EVENT_PLAYER_ARROW_UP_DOWN)
	constant Event EVENT_NATIVE_ARROW_UP_UP = GetHandleId(EVENT_PLAYER_ARROW_UP_UP)
	constant Event EVENT_NATIVE_UNIT_SELL = GetHandleId(EVENT_PLAYER_UNIT_SELL)
	constant Event EVENT_NATIVE_UNIT_CHANGE_OWNER = GetHandleId(EVENT_PLAYER_UNIT_CHANGE_OWNER)
	constant Event EVENT_NATIVE_UNIT_SELL_ITEM = GetHandleId(EVENT_PLAYER_UNIT_SELL_ITEM)
	constant Event EVENT_NATIVE_UNIT_SPELL_CHANNEL = GetHandleId(EVENT_PLAYER_UNIT_SPELL_CHANNEL)
	constant Event EVENT_NATIVE_UNIT_SPELL_CAST = GetHandleId(EVENT_PLAYER_UNIT_SPELL_CAST)
	constant Event EVENT_NATIVE_UNIT_SPELL_EFFECT = GetHandleId(EVENT_PLAYER_UNIT_SPELL_EFFECT)
	constant Event EVENT_NATIVE_UNIT_SPELL_FINISH = GetHandleId(EVENT_PLAYER_UNIT_SPELL_FINISH)
	constant Event EVENT_NATIVE_UNIT_SPELL_ENDCAST = GetHandleId(EVENT_PLAYER_UNIT_SPELL_ENDCAST)
	constant Event EVENT_NATIVE_UNIT_PAWN_ITEM = GetHandleId(EVENT_PLAYER_UNIT_PAWN_ITEM)

	// Cобытие входа в карту (игнорирует дамми-юниты)
	//
	// GetTriggerUnit() -> unit
	constant Event EVENT_ENTER = undefined

	//===============================
	//=========== FATIGUE ===========

	// Событие при изменении уровня усталости юнита
	//
	// GetFatigueUnit() -> unit
	constant Event EVENT_FATIGUE_CHANGE = undefined

	//============================
	//=========== GOLD ===========

	// Событие модификатора золота
	// GetGoldModifierBonus() -> real
	// GetGoldModifierPenalty() -> real
	// GetGoldModifierIncrease() -> real
	// GetGoldModifierDecrease() -> real
	// AddGoldModifierBonus(real goldBonus)
	// AddGoldModifierPenalty(real goldPenalty)
	// AddGoldModifierIncrease(real goldIncrease)
	// AddGoldModifierDecrease(real goldDecrease)
	// GetGoldPlayer() -> player
	// GetGoldSourceUnit() -> unit
	constant Event EVENT_GOLD_MODIFIER = undefined

	// GetGoldPlayer() -> player
	// GetGoldSourceUnit() -> unit
	// GetGoldAmount() -> real
	constant Event EVENT_GOLD = undefined

	//==============================================
	//=========== HEAL LIFESTEAL RESTORE ===========
	constant Event EVENT_HEAL_MODIFIER = undefined
	constant Event EVENT_HEAL = undefined
	constant Event EVENT_LIFESTEAL_MODIFIER = undefined
	constant Event EVENT_LIFESTEAL = undefined
	constant Event EVENT_RESTORE_MODIFIER = undefined
	constant Event EVENT_RESTORE = undefined

	//==================================
	//=========== MOVE SPEED ===========

	// Событие модификатора скорости перемешения
	//
	// GetMSUnit() -> unit
	// GetMSBonus() -> real
	// GetMSPenalty() -> real
	// GetMSIncrease() -> real
	// GetMSDecrease() -> real
	// GetMSMinCap() -> real
	// GetMSMaxCap() -> real
	// GetMSSlowResist() -> real
	// AddMSBonus(real v)
	// AddMSPenalty(real v)
	// AddMSIncrease(real v)
	// AddMSDecrease(real v)
	// AddMSSlowResist(real v)
	// AddMSCap(real cap, boolean isMin)
	constant Event EVENT_MOVE_SPEED = undefined

	//==============================
	//=========== PICKUP ===========

	// Событие получения предмета
	//
	// GetPickedUpUnit() -> unit
	// GetPickingUnit() -> unit
	constant Event EVENT_PICK_UP = undefined

	//====================================
	//=========== REGENERATION ===========

	// Событие модификатора регенерации здоровья
	//
	// GetRegenModifierUnit() -> unit
	// GetRegenModifierFlat() -> real
	// GetRegenModifierPenalty() -> real
	// GetRegenModifierIncrease() -> real
	// GetRegenModifierDecrease() -> real
	// AddRegenModifierFlat(real regenFlat)
	// AddRegenModifierPenalty(real regenPenalty)
	// AddRegenModifierIncrease(real regenIncrease)
	// AddRegenModifierDecrease(real regenDecrease)
	// SetRegenModifierFlat(real regenFlat)
	// SetRegenModifierPenalty(real regenPenalty)
	// SetRegenModifierIncrease(real regenIncrease)
	// SetRegenModifierDecrease(real regenDecrease)
	constant Event EVENT_HP_REGENERATION_MODIFIER = undefined

	// Событие регенерации здоровья
	//
	// GetRegenUnit() -> unit
	// GetRegenValue() -> real
	constant Event EVENT_HP_REGENERATION = undefined

	// Событие модификатора регенерации маны
	//
	// GetRegenModifierUnit() -> unit
	// GetRegenModifierFlat() -> real
	// GetRegenModifierPenalty() -> real
	// GetRegenModifierIncrease() -> real
	// GetRegenModifierDecrease() -> real
	// AddRegenModifierFlat(real regenFlat)
	// AddRegenModifierPenalty(real regenPenalty)
	// AddRegenModifierIncrease(real regenIncrease)
	// AddRegenModifierDecrease(real regenDecrease)
	// SetRegenModifierFlat(real regenFlat)
	// SetRegenModifierPenalty(real regenPenalty)
	// SetRegenModifierIncrease(real regenIncrease)
	// SetRegenModifierDecrease(real regenDecrease)
	constant Event EVENT_MP_REGENERATION_MODIFIER = undefined

	// Событие регенерации маны
	//
	// GetRegenUnit() -> unit
	// GetRegenValue() -> real
	constant Event EVENT_MP_REGENERATION = undefined

	//=============================
	//=========== STUNS ===========

	// Событие оглушения юнита
	//
	// GetTriggerStun() -> Stun
	// GetStunningUnit() -> unit
	// GetStunnedUnit() -> unit
	// GetStunTypeId() -> integer
	// GetStunDuration() -> real
	// GetStunIsEnter() -> boolean
	// GetStunIsOut() -> boolean
	// GetStunIsFirst() -> boolean
	constant Event EVENT_STUN = undefined

	// @const идентификаторы типов оглушения
	constant integer NORMAL_STUN = 1
	constant integer LOST_CONTROL_STUN = 2
	constant integer FROST_STUN = 3
	constant integer CHAINS_STUN = 4
	constant integer AQUA_STUN = 5
	constant integer STANLEY_STUN = 6
	constant integer GOLD_STUN = 7
	constant integer ILLIDAN_STUN = 8
	constant integer BOLA_STUN = 9
	constant integer ARTHAS_STUN = 10

	//==============================
	//=========== TALENT ===========
	constant Event EVENT_TALENT_CHOSEN = undefined

	//====================================
	//=========== HASH CLEANER ===========

	// Событие при очистке хэш-таблицы для юнита
	//
	// GetTriggerHandleId() -> integer
	constant Event EVENT_CLEAR_HASH = undefined

endglobals

	//===================================
	//=========== AREA SPELLS ===========

	// Прикрепляет эффект к заклинанию.
	// Следующий вызов заменит эффект.
	//
	// @arg effect `stunned` эффект.
	// @arg AreaSpell `whichSpell` заклинание.
	native AttachEffectToAreaSpell takes effect whichEffect, AreaSpell whichSpell returns nothing //! [Effect], TriggerActions

	// Добавляет заклинание области к юниту.
	//
	// @arg unit `ownerUnit` юнит, владеющий заклинанием.
	// @arg unit `dummyUnit` юнит, применяющий заклинание (может быть таким же как и  `unit ownerUnit`).
	// @arg integer `actionsId` идентификатор действий заклинания.
	// @arg real `duration` длительность действия заклинания.
	// @arg boolean `pierceDeath` работает ли заклинание сквозь смерть `unit dummyUnit`.
	// @arg boolexpr `filter` функция-фильтр.
	// @arg real `rangeStart` начальный радиус области действия заклинания.
	// @arg real `rangeEnd` конечный радиус области действия заклинания.
	// @arg real `interval` интервал регистрации юнитов в области.
	// @return object `AreaSpell` - возвращает объект заклинания области.
	native AddAreaSpellToUnit takes unit ownerUnit, unit dummyUnit, integer actionsId, real duration, boolean pierceDeath, boolexpr filter, real rangeStart, real rangeEnd, real interval returns AreaSpell //! [Unit], TriggerActions, TriggerCalls

	//==================================
	//=========== ATTACHMENT ===========
	native AttachUnitToUnit takes unit attached, unit target, real offsetX, real offsetY, real offsetZ returns Attachment //! [Unit], TriggerActions, TriggerCalls
	native DetachUnit takes unit attached returns nothing //! [Unit], TriggerActions

	//====================================
	//=========== ATTACK SPEED ===========
	native GetASUnit takes nothing returns unit //! [ResponseAS], TriggerCalls
	native GetASBonus takes nothing returns real //! [ResponseAS], TriggerCalls
	native GetASPenalty takes nothing returns real //! [ResponseAS], TriggerCalls
	native GetASIncrease takes nothing returns real //! [ResponseAS], TriggerCalls
	native GetASDecrease takes nothing returns real //! [ResponseAS], TriggerCalls
	native AddASBonus takes real asBonus returns nothing //! [RequestAS], TriggerActions
	native AddASPenalty takes real asPenalty returns nothing //! [RequestAS], TriggerActions
	native AddASIncrease takes real asIncrease returns nothing //! [RequestAS], TriggerActions
	native AddASDecrease takes real asDecrease returns nothing //! [RequestAS], TriggerActions
	native SetASBonus takes real asBonus returns nothing //! [RequestAS], TriggerActions
	native SetASPenalty takes real asPenalty returns nothing //! [RequestAS], TriggerActions
	native SetASIncrease takes real asIncrease returns nothing //! [RequestAS], TriggerActions
	native SetASDecrease takes real asDecrease returns nothing //! [RequestAS], TriggerActions

	// Возвращает кэшированную скорость атаки юнита
	// @arg unit whichUnit целевой юнит
	// @return real скорость атаки юнита
	native GetUnitAttackSpeed takes unit whichUnit returns real //! [Unit], TriggerCalls

	// Обновляет скорость атаки юнита
	// @arg unit whichUnit целевой юнит
	// @return real скорость атаки юнита
	native UpdateUnitAttackSpeed takes unit whichUnit returns real //! [Unit], TriggerActions, TriggerCalls

	//=============================
	//=========== AURAS ===========
	native GetAuraOwnerUnit takes nothing returns unit //! [ResponseAura], TriggerCalls
	native GetAuraTargetUnit takes nothing returns unit //! [ResponseAura], TriggerCalls
	native IsAuraEntered takes nothing returns boolean //! [ResponseAura], TriggerCalls
	native IsAuraOut takes nothing returns boolean //! [ResponseAura], TriggerCalls
	native IsAuraActions takes nothing returns boolean //! [ResponseAura], TriggerCalls
	native GetAuraActionsId takes nothing returns integer //! [ResponseAura], TriggerCalls

	// Возвращает ауру типа `typeId`, которая действует на юнита
	// @arg unit u цель
	// @arg integer typeId тип ауры
	// @return Aura объект ауры или 0
	native GetTargetAuraByType takes unit u, integer typeId returns Aura //! [Aura], TriggerCalls

	// Возвращает ауру типа `typeId`, которую излучает юнит
	// @arg unit u владелец
	// @arg integer typeId тип ауры
	// @return Aura объект ауры или 0
	native GetOwnerAuraByType takes unit u, integer typeId returns Aura //! [Aura], TriggerCalls

	// Считает количество аур данного типа, которые излучает юнит
	// @arg unit u владелец
	// @arg integer typeId тип ауры
	// @return integer количество активных аур
	native GetCountOwnerAuraByType takes unit u, integer typeId returns integer //! [Aura], TriggerCalls

	// Считает количество аур данного типа, которые действуют на юнита
	// @arg unit u цель
	// @arg integer typeId тип ауры
	// @return integer количество активных аур
	native GetCountTargetAuraByType takes unit u, integer typeId returns integer //! [Aura], TriggerCalls

	// Возвращает юнита-владельца ауры типа `typeId`, которая действует на `u`
	// @arg unit u — цель
	// @arg integer typeId — тип ауры
	// @return unit — владелец ауры или null
	native GetUnitOwnerForTargetAuraByType takes unit u, integer typeId returns unit //! [Aura], TriggerCalls

	// Проверяет, действует ли на юнита цель аура с указанным типом
	// @arg unit u цель
	// @arg integer typeId тип ауры
	// @return boolean true, если такая аура действует
	native IsUnitTargetAddedTypeAura takes unit u, integer typeId returns boolean //! [Aura], TriggerCalls

	// Проверяет, излучает ли юнит ауру с указанным типом
	// @arg unit u владелец
	// @arg integer typeId тип ауры
	// @return boolean true, если юнит излучает ауру этого типа
	native IsUnitOwnerAddedTypeAura takes unit u, integer typeId returns boolean //! [Aura], TriggerCalls

	// Удаляет все ауры указанного типа у юнита
	// @arg unit u владелец аур
	// @arg integer typeId тип ауры
	// @arg boolean AllowMultiType если true, то не удаляет multi-type ауры
	native DestroyUnitAurasByType takes unit u, integer typeId, boolean AllowMultiType returns nothing //! [Aura], TriggerActions

	// Добавляет ауру к юниту с заданными параметрами
	// @arg unit auraUnit владелец ауры
	// @arg integer typeId тип ауры
	// @arg item itemAura предмет, к которому привязана аура (опционально)
	// @arg boolean multiAurasToTarget стакается ли аура по целям
	// @arg integer priority приоритет (для нестакуемых аур)
	// @arg boolean multiAurasForOwner стакается ли аура в инвентаре
	// @arg boolean refreshOutEnter обновлять ли вход/выход при удалении
	// @arg boolean hardRefresh насильно обновлять вход/выход
	// @arg integer actionsId ID набора действий для ауры
	// @arg boolexpr filter фильтр целей ауры (опционально)
	// @arg real radiusMax радиус действия ауры
	// @arg real endDuration длительность действия после выхода из зоны
	// @arg boolean periodActions включить периодические действия
	// @arg real period интервал периодических действий
	// @return Aura ссылка на созданную ауру
	native AddAuraToUnit takes unit auraUnit, integer typeId, item itemAura, boolean multiAurasToTarget, integer priority, boolean multiAurasForOwner, boolean refreshOutEnter, boolean hardRefresh, integer actionsId, boolexpr filter, real radiusMax, real endDuration, boolean periodActions, real period returns nothing //! [Aura], TriggerActions, TriggerCalls

	//=============================
	//=========== BUFFS ===========
	native GetTriggerBuffOwner takes nothing returns unit //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffTarget takes nothing returns unit //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffIsEntered takes nothing returns boolean //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffIsOut takes nothing returns boolean //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffIsActions takes nothing returns boolean //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffIsTransfer takes nothing returns boolean //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffActionsId takes nothing returns integer //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffId takes nothing returns integer //! [ResponseBuff], TriggerCalls
	native GetTriggerBuffStack takes nothing returns timer //! [ResponseBuff], TriggerCalls
	native GetBuffDataInt takes Buff buf returns integer //! [Buff], TriggerCalls
	native GetBuffDataReal takes Buff buf returns real //! [Buff], TriggerCalls
	native GetBuffOwnerUnit takes Buff buf returns unit //! [Buff], TriggerCalls
	native GetBuffTargetUnit takes Buff buf returns unit //! [Buff], TriggerCalls
	native GetBuffActionsId takes Buff buf returns integer //! [Buff], TriggerCalls
	native GetBuffMaxDuration takes Buff buf returns real //! [Buff], TriggerCalls
	native GetBuffDefaultDuration takes Buff buf returns real //! [Buff], TriggerCalls
	native GetBuffRemainingTimeToAction takes Buff buf returns real //! [Buff], TriggerCalls
	native GetBuffRemainingDuration takes Buff buf returns real //! [Buff], TriggerCalls
	native GetBuffRank takes Buff buf returns integer //! [Buff], TriggerCalls
	native GetBuffDispelDifficulty takes Buff buf returns integer //! [Buff], TriggerCalls
	native GetBuffStackable takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffSingleDuration takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffSingleOutEnter takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffSinglePeriod takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffPierceSpellImmun takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffPierceInvul takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffPierceDeath takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffPeriodActions takes Buff buf returns boolean //! [Buff], TriggerCalls
	native GetBuffPeriod takes Buff buf returns real //! [Buff], TriggerCalls
	native SetBuffDataInt takes Buff buf, integer dataInt returns nothing //! [Buff], TriggerActions
	native SetBuffDataReal takes Buff buf, real dataReal returns nothing //! [Buff], TriggerActions
	native SetBuffOwner takes Buff buf, unit ownerUnit returns nothing //! [Buff], TriggerActions
	native SetBuffTarget takes Buff buf, unit targetUnit returns nothing //! [Buff], TriggerActions
	native SetBuffActionsId takes Buff buf, integer actionsId returns nothing //! [Buff], TriggerActions
	native SetBuffDuration takes Buff buf, real duration returns nothing //! [Buff], TriggerActions
	native ReduceBuffRemainingDuration takes Buff buf, real coef returns nothing //! [Buff], TriggerActions
	native AddBuffRemainingDuration takes Buff buf, real duration returns nothing //! [Buff], TriggerActions
	native SetBuffRank takes Buff buf, integer rank returns nothing //! [Buff], TriggerActions
	native SetBuffDispelDifficulty takes Buff buf, integer dispelDifficulty returns nothing //! [Buff], TriggerActions
	native SetBuffStackable takes Buff buf, boolean stackable returns nothing //! [Buff], TriggerActions
	native SetBuffSingleDuration takes Buff buf, boolean singleDuration returns nothing //! [Buff], TriggerActions
	native SetBuffSingleOutEnter takes Buff buf, boolean singleOutEnter returns nothing //! [Buff], TriggerActions
	native SetBuffSinglePeriod takes Buff buf, boolean singlePeriod returns nothing //! [Buff], TriggerActions
	native SetBuffPierceSpellImmun takes Buff buf, boolean pierceSpellImmun returns nothing //! [Buff], TriggerActions
	native SetBuffPierceInvul takes Buff buf, boolean pierceInvul returns nothing //! [Buff], TriggerActions
	native SetBuffPierceDeath takes Buff buf, boolean pierceDeath returns nothing //! [Buff], TriggerActions
	native SetBuffPeriod takes Buff buf, real period returns nothing //! [Buff], TriggerActions

	// Выполняет периодические действия баффа вручную
	// @arg Buff buf - бафф
	native ExecuteBuffActions takes Buff buf returns nothing //! [Buff], TriggerActions

	// Выполняет периодические действия стака баффа вручную
	// @arg Buff buf - бафф
	// @arg timer buffStack - таймер стака
	native ExecuteBuffStackActions takes Buff buf, timer buffStack returns nothing //! [Buff], TriggerActions

	// Активирует периодические действия баффа
	// Если таймер уже есть - просто рестартует
	// @arg Buff buf - бафф
	native EnableBuffPeriod takes Buff buf returns nothing //! [Buff], TriggerActions

	// Возвращает количество стаков у баффа
	// @arg Buff buf - бафф
	// @return integer - число стаков
	native GetBuffStacks takes Buff buf returns integer //! [Buff], TriggerCalls

	// Обновляет длительность у всех стаков баффа
	// Учитывает модификаторы от ранга
	// @arg Buff buf - бафф
	native RefreshDurationBuffStacks takes Buff buf returns nothing //! [Buff], TriggerActions

	// Возвращает целочисленное значение, привязанное к конкретному стаку баффа
	// Используется для хранения индивидуальных параметров стака
	// @arg timer buffStack - таймер стака баффа
	// @return integer - целочисленное значение, сохранённое в стаке
	native GetBuffStackDataInt takes timer buffStack returns integer //! [Buff], TriggerCalls

	// Возвращает вещественное значение, привязанное к конкретному стаку баффа
	// Используется для хранения индивидуальных параметров стака
	// @arg timer buffStack - таймер стака баффа
	// @return real - вещественное значение, сохранённое в стаке
	native GetBuffStackDataReal takes timer buffStack returns real //! [Buff], TriggerCalls

	// Возвращает оставшееся время до окончания жизни стака
	// Работает как TimerGetRemaining()
	// @arg timer buffStack - таймер стака баффа
	// @return real - оставшееся время
	native GetBuffStackRemainingDuration takes timer buffStack returns real //! [Buff], TriggerCalls

	// Устанавливает целочисленное значение стака и корректирует общее значение баффа
	// Вычитает старое значение, прибавляет новое — позволяет точно трекать вклад стаков
	// @arg Buff buf - бафф
	// @arg timer buffStack - стак, которому назначается значение
	// @arg integer dataInt - новое значение
	native SetBuffStackDataInt takes Buff buf, timer buffStack, integer dataInt returns nothing //! [Buff], TriggerActions

	// Устанавливает вещественное значение стака и корректирует общее значение баффа
	// Вычитает старое значение, прибавляет новое — синхронизирует вклад стаков
	// @arg Buff buf - бафф
	// @arg timer buffStack - стак, которому назначается значение
	// @arg real dataReal - новое значение
	native SetBuffStackDataReal takes Buff buf, timer buffStack, real dataReal returns nothing //! [Buff], TriggerActions

	// Добавляет кастомный бафф на цель с множеством параметров контроля
	// @arg ownerUnit - юнит, который наложил бафф
	// @arg targetUnit - юнит, на которого вешается бафф
	// @arg typeId - уникальный тип баффа
	// @arg actionsId - ID набора действий
	// @arg duration - базовая длительность
	// @arg rank - ранг (0 - дебафф, 1 - бафф, ≥2 - спец)
	// @arg dispelDifficulty - сложность развеивания баффа (рассеиваются баффы равны или ниже этому значению)
	// @arg stackable - true - бафф получает стаки в случае если бафф такого же типа уже активен, false - бафф замещается новым
	// @arg singleDuration - true - стаки используют единую длительность баффа, false - стаки используют независимую длительность (для стакабельных) (для нестакабельных true будет обновлять параметры и длительность баффа)
	// @arg singleOutEnter - true - дополнительные стаки стакабельного баффа не будут триггерить действия входа/выхода, для нестакабельных действия входа/выхода не будут запущены при замещении баффа
	// @arg singlePeriod - true - бафф имеет единый таймер периодических действий, false - стаки имеют свои таймеры периодических действий (только для stackable)
	// @arg countStacks - /максимальное количество стаков (при переполненности уничтожает стак с самой маленькой длительностью (с действием выхода) и создает новый стак (с действием входа))
	// @arg pierceSpellImmun - false - бафф автоматически снимется, если юнит станет неуязвимым к магии, true - игнорирует неуязвимость к магии
	// @arg pierceInvul - false - бафф автоматически снимется, если юнит станет неуязвимым, true - игнорирует неуязвимость
	// @arg pierceDeath - false - бафф автоматически снимется, если юнит умрет, true - игнорирует смерть юнита
	// @arg periodActions - включить периодические действия (true - вкл, false - выкл)
	// @arg period - промежуток времени между периодическими действиями
	// @return Buff - созданный объект баффа
	native AddBuffToUnit takes unit ownerUnit, unit targetUnit, integer typeId, integer actionsId, real duration, integer rank, integer dispelDifficulty, boolean stackable, boolean singleDuration, boolean singleOutEnter, boolean singlePeriod, integer countStacks, boolean pierceSpellImmun, boolean pierceInvul, boolean pierceDeath, boolean periodActions, real period returns nothing //! [Buff], TriggerActions, TriggerCalls

	// Переносит активные баффы от ownerUnit на targetUnit
	// Только баффы указанного ранга и с dispelDifficulty ≤ указанного
	// @arg ownerUnit - юнит-источник
	// @arg targetUnit - юнит-получатель
	// @arg rank - целевой ранг
	// @arg dispelDifficulty - макс. сложность развеивания
	native TransferUnitBuffsToUnit takes unit ownerUnit, unit targetUnit, integer rankC, integer dispelDifficultyC returns nothing //! [Buff], TriggerActions

	// Возвращает текущий бафф цикла фильтрации
	// Используется внутри условной функции фильтрации
	// @return Buff - текущий обрабатываемый бафф
	native GetFilterBuff takes nothing returns Buff //! [ResponseBuffLoop], TriggerCalls

	// Возвращает i-й бафф, попавший под фильтрацию в InitBuffsLoop
	// @arg integer i - индекс (от 1 до GetCountSelectedBuffs())
	// @return Buff - выбранный бафф
	native GetSelectedBuff takes integer i returns Buff //! [ResponseBuffLoop], TriggerCalls

	// Возвращает количество выбранных баффов, прошедших фильтрацию
	// Используется для обхода SELECTED_BUFF_GET[]
	// @return integer - число выбранных баффов
	native GetCountSelectedBuffs takes nothing returns integer //! [ResponseBuffLoop], TriggerCalls

	// Инициализирует цикл фильтрации баффов юнита
	// Перед каждым баффом устанавливает FILTER_BUFF_GET, затем вызывает функцию condition
	// Если FILTER_BOOLEAN_GET = true — бафф записывается в SELECTED_BUFF_GET
	// @arg unit u - юнит, чьи баффы проверяются
	// @arg string condition - имя функции-фильтра (использует ExecuteFunc)
	native InitBuffsLoop takes unit u, string condition returns nothing //! [Buff], TriggerActions

	//==============================
	//=========== COMBAT ===========
	native GetCombatUnit takes nothing returns unit //! [ResponseCombat], TriggerCalls
	native IsCombatEntering takes nothing returns boolean //! [ResponseCombat], TriggerCalls
	native IsCombatLeaving takes nothing returns boolean //! [ResponseCombat], TriggerCalls

	// Проверяет, находится ли юнит в сражении
	// @arg unit whichUnit целевой юнит
	// @return boolean true, если юнит в бою
	native IsUnitInCombat takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	//==================================
	//=========== CONDITIONS ===========
	native GetFilterOwnerUnit takes nothing returns unit //! [ResponseCondition], TriggerCalls
	native GetFilterTargetUnit takes nothing returns unit //! [ResponseCondition], TriggerCalls
	native GetFilterReal takes nothing returns real //! [ResponseCondition], TriggerCalls

	// Инициализирует условие вместе с передачей параметров
	// @arg code func код фильтрации
	// @arg unit ownerUnit юнит-владелец условия
	// @return conditionfunc
	native ConditionWithOwner takes code func, unit ownerUnit returns conditionfunc //! [Condition], TriggerCalls

	// Инициализирует условие вместе с передачей параметров
	// @arg code func код фильтрации
	// @arg unit ownerUnit юнит-владелец условия
	// @arg unit targetUnit юнит-цель условия
	// @return conditionfunc
	native ConditionParameters takes code func, unit ownerUnit, unit targetUnit, real filterReal returns conditionfunc //! [Condition], TriggerCalls

	// Проверяет, может ли юнит быть перемещён
	// @arg unit initiator инициатор проверки
	// @arg unit target целевой юнит
	// @return boolean
	native IsUnitCanBeMoved takes unit initiator, unit target returns boolean //! [Unit], TriggerCalls

	// Проверяет, является ли юнит разоружённым
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitDisarmed takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	// Проверяет, может ли юнит выполнять действия
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitCanDoActions takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	// Проверяет, может ли юнит атаковать
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitCanAttack takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	// Проверяет, есть ли у юнита атака
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitHasAttack takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	// Проверяет, является ли юнит строением
	// @arg unit whichUnit целевой юнит
	// @return boolean
	native IsUnitStructure takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	//===============================
	//=========== CRYSTAL ===========
	native GetCapturingPlayer takes nothing returns player //! [ResponseCrystal], TriggerCalls

	//==============================
	//=========== DAMAGE ===========

	// Отключает детект урона
	native DisableDetectDamage takes nothing returns nothing //! [Damage], TriggerActions

	// Включает детект урона
	native EnableDetectDamage takes nothing returns nothing //! [Damage], TriggerActions
	native GetModifierAttackedUnit takes nothing returns unit //! [ResponseModifierDamage], TriggerCalls
	native GetModifierAttackingUnit takes nothing returns unit //! [ResponseModifierDamage], TriggerCalls
	native GetModifierSourceUnit takes nothing returns unit //! [ResponseModifierDamage], TriggerCalls
	native GetModifierSourcePosition takes nothing returns Point2D //! [ResponseModifierDamage], TriggerCalls
	native IsModifierIgnoreBlock takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierAttack takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierCritical takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierDodge takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierMagical takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierNoRepeat takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierPhysical takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierPure takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierReflection takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierSimulate takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native IsModifierSpecAttack takes nothing returns boolean //! [ResponseModifierDamage], TriggerCalls
	native AddModifierDodgeChance takes real dodgeChance returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierDodgeChance takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierDodgeChance takes real dodgeChance returns nothing //! [RequestModifierDamage], TriggerActions
	native AddModifierMissChance takes real missChance returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierMissChance takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierMissChance takes real missChance returns nothing //! [RequestModifierDamage], TriggerActions
	native AddModifierTrueStrikeChance takes real trueStrikeChance returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierTrueStrikeChance takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierTrueStrikeChance takes real trueStrikeChance returns nothing //! [RequestModifierDamage], TriggerActions
	native AddModifierPierceRate takes real pierceRate returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierPierceRate takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierPierceRate takes real pierceRate returns nothing //! [RequestModifierDamage], TriggerActions
	native SetModifierPierceType takes integer pierceType returns nothing //! [RequestModifierDamage], TriggerActions
	native AddModifierDMGAdd takes real dmgAdd returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierDMGAdd takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierDMGAdd takes real dmgAdd returns nothing //! [RequestModifierDamage], TriggerActions
	native AddModifierDMGAmplifier takes integer typeAmplifier, real dmgAmplifier returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierDMGAmplifier takes integer typeAmplifier returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierDMGAmplifier takes integer typeAmplifier, real dmgAmplifier returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierCriticalType takes nothing returns integer //! [RequestModifierDamage], TriggerActions
	native AddModifierCriticalRate takes integer typeId, real criticalRate returns nothing //! [RequestModifierDamage], TriggerActions
	native PlusModifierCriticalRate takes real criticalRate returns nothing //! [RequestModifierDamage], TriggerActions
	native AddModifierCriticalDamage takes integer typeId, real criticalDamage returns nothing //! [RequestModifierDamage], TriggerActions
	native AddModifierBash takes integer typeId, real bashDamage, real duration returns nothing //! [RequestModifierDamage], TriggerActions
	native GetBlockedFromAmount takes real amount returns real //! [ResponseModifierDamage], TriggerCalls
	native GetModifierDamageGiven takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierDamageGiven takes real dmgGiven returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierDamageTaken takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierDamageTaken takes real dmgTaken returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierDamageMax takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native SetModifierDamageMax takes real dmgMax returns nothing //! [RequestModifierDamage], TriggerActions
	native GetModifierArmorReduction takes nothing returns real //! [ResponseModifierDamage], TriggerCalls
	native GetDamageAttackedUnit takes nothing returns unit //! [ResponseDamage], TriggerCalls
	native GetDamageAttackingUnit takes nothing returns unit //! [ResponseDamage], TriggerCalls
	native GetDamageSourceUnit takes nothing returns unit //! [ResponseDamage], TriggerCalls
	native GetDamageSourcePosition takes nothing returns Point2D //! [ResponseDamage], TriggerCalls
	native GetDamageBash takes nothing returns real //! [ResponseDamage], TriggerCalls
	native GetDamageBashDuration takes nothing returns real //! [ResponseDamage], TriggerCalls
	native GetDamageBlocked takes nothing returns real //! [ResponseDamage], TriggerCalls
	native GetDamageGiven takes nothing returns real //! [ResponseDamage], TriggerCalls
	native GetDamageIgnoreBlock takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsAttack takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsBlocked takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsCritical takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsDodge takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsMagical takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsNoRepeat takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsPhysical takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsPure takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsReflection takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsSimulate takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageIsSpecAttack takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDamageLifeAttackedUnit takes nothing returns real //! [ResponseDamage], TriggerCalls
	native GetDamageIsRunPass takes nothing returns boolean //! [ResponseDamage], TriggerCalls
	native GetDeathKillingUnit takes nothing returns unit //! [ResponseDeath], TriggerCalls
	native GetDeathKilledUnit takes nothing returns unit //! [ResponseDeath], TriggerCalls

	//==============================
	//=========== EVENTS ===========

	// Создаёт новое пользовательское событие и возвращает его ID
	// @arg string name - название события (для отладки и логов)
	// @return Event новое событие
	native CreateEvent takes string name returns Event //! [Event], TriggerCalls

	// Проверяет, активно ли сейчас выполнение данного события
	// @arg Event eventId событие
	// @return boolean true если сейчас выполняется
	native IsEventRun takes Event eventId returns boolean //! [Event], TriggerCalls

	// Возвращает имя события по его ID
	// @arg Event eventId - ID события
	// @return string - имя события (устанавливается в CreateEvent)
	native GetEventName takes Event eventId returns string //! [Event], TriggerCalls

	// Принудительно выполняет событие (вызов всех его обработчиков)
	// @arg Event eventId событие
	native ExecuteEvent takes Event eventId returns nothing //! [Event], TriggerActions

	// Регистрирует действие на указанное событие
	// Автоматически вешает `code` на единый триггер для всех игроков
	// @arg Event eventId - ID события (GetHandleId(EVENT_PLAYER_...) или кастомный событие (EVENT_AURA_...))
	// @arg code action - функция, которую нужно выполнят при срабатывании события
	// @return triggeraction - ссылка на зарегистрированное действие
	native EventRegisterAction takes Event eventId, code action returns triggeraction //! [EventHandler], TriggerActions, TriggerCalls

	// Удаляет ранее зарегистрированное действие с события
	// @arg Event eventId - ID события
	// @arg triggeraction action - ссылка на действие, полученное из EventRegisterAction
	native EventUnregisterAction takes Event eventId, triggeraction action returns nothing //! [EventHandler], TriggerActions

	// Регистрирует GUI-триггер на указанное событие (со всеми его условиями/действиями).
	// Работает и для системных EVENT_GAME/PLAYER/PLAYER_UNIT, и для кастомных CreateEvent().
	// @arg trigger trg триггер из GUI (или созданный кодом), который должен срабатывать на eventId
	// @arg Event eventId ID события
	native EventRegisterTrigger takes trigger trg, Event eventId returns nothing //! [EventHandler], TriggerEvents, TriggerActions

	//===============================
	//=========== FATIGUE ===========
	native GetFatigueUnit takes nothing returns unit //! [ResponseFatigue], TriggerCalls

	// Возвращает текущий уровень усталости юнита
	// @arg unit whichUnit - целевой юнит
	// @return real - уровень усталости (0.0 ... FATIGUE_MAX)
	native GetUnitFatigue takes unit whichUnit returns real //! [Unit], TriggerCalls

	// Принудительно устанавливает уровень усталости юнита
	// Значение будет ограничено от 0.0 до FATIGUE_MAX
	// @arg unit whichUnit - целевой юнит
	// @arg real fatigue - желаемый уровень усталости
	native SetUnitFatigue takes unit whichUnit, real fatigue returns nothing //! [Unit], TriggerActions

	// Проверяет, достиг ли юнит максимального уровня усталости
	// @arg unit whichUnit - целевой юнит
	// @return boolean - true, если усталость >= FATIGUE_MAX
	native IsUnitFatigued takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	//============================
	//=========== GOLD ===========

	// Event Modifier Getters
	native GetGoldModifierBonus takes nothing returns real //! [ResponseGoldModifier], TriggerCalls
	native GetGoldModifierPenalty takes nothing returns real //! [ResponseGoldModifier], TriggerCalls
	native GetGoldModifierIncrease takes nothing returns real //! [ResponseGoldModifier], TriggerCalls
	native GetGoldModifierDecrease takes nothing returns real //! [ResponseGoldModifier], TriggerCalls

	// Event Modifier Adders
	native AddGoldModifierBonus takes real goldBonus returns nothing //! [RequestGoldModifier], TriggerActions
	native AddGoldModifierPenalty takes real goldPenalty returns nothing //! [RequestGoldModifier], TriggerActions
	native AddGoldModifierIncrease takes real goldIncrease returns nothing //! [RequestGoldModifier], TriggerActions
	native AddGoldModifierDecrease takes real goldDecrease returns nothing //! [RequestGoldModifier], TriggerActions

	// Event Gold and Modifier Getters
	native GetGoldPlayer takes nothing returns player //! [ResponseGold], TriggerCalls
	native GetGoldSourceUnit takes nothing returns unit //! [ResponseGold], TriggerCalls
	native GetGoldAmount takes nothing returns real //! [ResponseGold], TriggerCalls

	// Добавляет золото игроку с возможностью модификации суммы через EVENT_GOLD_MODIFIER
	// Если итоговая сумма больше 0 - добавляет золото и вызывает событие EVENT_GOLD
	// @arg player whichPlayer - игрок, которому начисляется золото
	// @arg unit sourceUnit - юнит-источник (например, убитый враг)
	// @arg real amount - базовая сумма золота (до модификаторов)
	native AddGold takes player whichPlayer, unit sourceUnit, real amount returns nothing //! [Player], TriggerActions

	//==============================================
	//=========== HEAL LIFESTEAL RESTORE ===========
	native GetHealAmount takes nothing returns real //! [ResponseHeal], TriggerCalls
	native GetHealedUnit takes nothing returns unit //! [ResponseHeal], TriggerCalls
	native GetHealingUnit takes nothing returns unit //! [ResponseHeal], TriggerCalls
	native GetOverHeal takes nothing returns real //! [ResponseHeal], TriggerCalls
	native GetLifestealAmount takes nothing returns real //! [ResponseLifesteal], TriggerCalls
	native GetLifestealedUnit takes nothing returns unit //! [ResponseLifesteal], TriggerCalls
	native GetOverLifesteal takes nothing returns real //! [ResponseLifesteal], TriggerCalls
	native GetRestoredAmount takes nothing returns real //! [ResponseRestore], TriggerCalls
	native GetRestoredUnit takes nothing returns unit //! [ResponseRestore], TriggerCalls
	native GetRestoringUnit takes nothing returns unit //! [ResponseRestore], TriggerCalls
	native GetOverRestore takes nothing returns real //! [ResponseRestore], TriggerCalls
	native SetHealAmount takes real healAmount returns nothing //! [RequestHealModifier], TriggerActions
	native SetLifestealAmount takes real lifestealAmount returns nothing //! [RequestLifestealModifier], TriggerActions
	native SetRestoredAmount takes real restoredAmount returns nothing //! [RequestRestoreModifier], TriggerActions

	// Лечит юнита с возможностью модификации значения через EVENT_HEAL_MODIFIER
	// Если итоговое значение положительное - применяет лечение и вызывает EVENT_HEAL
	// @arg unit healingUnit - юнит, выполняющий лечение
	// @arg unit healedUnit - юнит, получающий лечение
	// @arg real amount - базовое значение лечения
	native HealUnit takes unit healingUnit, unit healedUnit, real amount returns nothing //! [Unit], TriggerActions

	// Применяет лайфстил к юниту с возможностью модификации значения через EVENT_LIFESTEAL_MODIFIER
	// Если итоговое значение положительное - восстанавливает здоровье и вызывает EVENT_LIFESTEAL
	// @arg unit whichUnit - юнит, получающий лайфстил
	// @arg real amount - базовое значение лайфстила
	native LifestealUnit takes unit whichUnit, real amount returns nothing //! [Unit], TriggerActions

	// Восстанавливает ману юниту с возможностью модификации значения через EVENT_RESTORE_MODIFIER
	// Если итоговое значение положительное - восстанавливает ману и вызывает EVENT_RESTORE
	// @arg unit restoringUnit - юнит, выполняющий восстановление
	// @arg unit restoredUnit - юнит, получающий восстановление маны
	// @arg real amount - базовое значение восстановления маны
	native RestoreManaUnit takes unit restoringUnit, unit restoredUnit, real amount returns nothing //! [Unit], TriggerActions

	//==============================
	//=========== HEROES ===========

	// Event Getters
	native GetBrokenStreak takes nothing returns integer //! [ResponseDeathHero], TriggerCalls

	// Обрабатывает событие убийства одним героем другого.
	//
	// @arg unit `killingHero` герой, совершивший убийство.
	// @arg unit `killedHero` герой, который был убит.
	native KillingEvent takes unit killingHero, unit killedHero returns nothing //! [Hero], TriggerActions

	// Проверяет, активен ли режим обнаружения величины атаки для героя.
	//
	// @arg unit `whichHero` герой.
	// @return boolean true, если режим обнаружения величины атаки активен.
	native IsHeroDetectAttack takes unit whichHero returns boolean //! [Hero], TriggerCalls

	// Устанавливает режим обнаружения величины атаки для героя.
	//
	// @arg unit `whichHero` герой.
	// @arg boolean `isDetectAttack` true, если режим обнаружения величины атаки должен быть активен.
	native SetHeroDetectAttack takes unit whichHero, boolean isDetectAttack returns nothing //! [Hero], TriggerActions

	// Возвращает величину атаки героя.
	//
	// @arg unit `whichHero` герой.
	// @return real величину атаки героя.
	native GetHeroAttackValue takes unit whichHero returns real //! [Hero], TriggerCalls

	// Устанавливает величину атаки для героя.
	//
	// @arg unit `whichHero` герой.
	// @arg real `attackValue` новое величину атаки.
	native SetHeroAttackValue takes unit whichHero, real attackValue returns nothing //! [Hero], TriggerActions

	// Возвращает общую серию убийств героя.
	//
	// @arg unit `whichHero` герой.
	// @return integer общее количество последовательных убийств.
	native GetHeroTotalStreak takes unit whichHero returns integer //! [Hero], TriggerCalls

	// Возвращает короткую серию убийств героя.
	//
	// @arg unit `whichHero` герой.
	// @return integer количество убийств в текущей короткой серии.
	native GetHeroShortStreak takes unit whichHero returns integer //! [Hero], TriggerCalls

	// Возвращает количество убийств игрока одного героя другим.
	//
	// @arg unit `originHero` герой, совершивший убийства.
	// @arg unit `targetHero` герой, который был убит.
	// @return integer количество убийств одного игрока другим.
	native GetHeroPlayerStreak takes unit originHero, unit targetHero returns integer //! [Hero], TriggerCalls

	//=================================
	//=========== ILLUSIONS ===========

	// Создает иллюзию для указанного игрока на основе юнита.
	//
	// @arg player `owner` владелец иллюзии.
	// @arg unit `source` юнит, на основе которого создается иллюзия.
	// @arg real `x` координата X для создания иллюзии.
	// @arg real `y` координата Y для создания иллюзии.
	// @arg real `facing` угол поворота иллюзии.
	// @return Illusion объект иллюзии.
	native CreateIllusion takes player owner, unit source, real x, real y, real facing returns Illusion //! [Unit], TriggerActions, TriggerCalls

	// Возвращает последний созданный объект иллюзии.
	//
	// @return Illusion объект иллюзии.
	native GetLastCreatedIllusion takes nothing returns Illusion //! [Unit], TriggerCalls

	// Возвращает объект иллюзии юнита.
	//
	// @arg unit `u` юнит иллюзии.
	// @return Illusion объект иллюзии.
	native GetUnitIllusion takes unit u returns Illusion //! [Unit], TriggerCalls

	// Возвращает юнита объекта иллюзии.
	//
	// @arg Illusion `illusion` объект юнита иллюзии.
	// @return юнит иллюзии.
	native GetIllusionUnit takes Illusion illusion returns unit //! [Unit], TriggerCalls

	// Устанавливает оставшееся время жизни для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой устанавливается время жизни.
	// @arg real `time` время жизни в секундах.
	// @return boolean `true`, если время жизни успешно установлено, иначе `false`.
	native SetIllusionRemainingTime takes Illusion illusion, real time returns boolean //! [Unit], TriggerActions

	// Устанавливает количество получаемого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой устанавливается получаемый урон.
	// @arg real `damageTaken` количество получаемого урона.
	// @return boolean `true`, если получаемый урон успешно установлен, иначе `false`.
	native SetIllusionDamageTaken takes Illusion illusion, real damageTaken returns boolean //! [Unit], TriggerActions

	// Устанавливает количество наносимого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой устанавливается наносимый урон.
	// @arg real `damageGiven` количество наносимого урона.
	// @return boolean `true`, если наносимый урон успешно установлен, иначе `false`.
	native SetIllusionDamageGiven takes Illusion illusion, real damageGiven returns boolean //! [Unit], TriggerActions

	// Возвращает количество получаемого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой возвращается получаемый урон.
	// @return real количество получаемого урона.
	native GetIllusionDamageTaken takes Illusion illusion returns real //! [Unit], TriggerCalls

	// Возвращает количество наносимого урона для указанной иллюзии.
	//
	// @arg Illusion `illusion` иллюзия, для которой возвращается наносимый урон.
	// @return real количество наносимого урона.
	native GetIllusionDamageGiven takes Illusion illusion returns real //! [Unit], TriggerCalls
	native GetHeroStatHook takes integer whichStat, unit whichHero, boolean includeBonuses returns integer //! [Hero], TriggerCalls

	//=====================================
	//=========== JUMP TO POINT ===========

	// Перемещает юнита в указанную позицию с помощью прыжка
	// @arg unit caster юнит, который будет прыгать
	// @arg real x позиция по X, куда будет прыгать юнит
	// @arg real y позиция по Y, куда будет прыгать юнит
	native JumpUnitToXY takes unit caster, real x, real y returns nothing //! [Unit], TriggerActions

	// Перемещает юнита в указанную точку с помощью прыжка
	// @arg unit caster юнит, который будет прыгать
	// @arg Point2D end новая позиция, куда будет прыгать юнит
	native JumpUnitToPoint takes unit caster, Point2D end returns nothing //! [Unit], TriggerActions

	//=================================
	//=========== LIGHTNING ===========

	// Создаёт графическую молнию между двумя юнитами
	// @arg unit caster юнит-источник молнии
	// @arg unit target юнит-цель молнии
	// @arg string lightningType тип молнии
	// @arg string effectCasterModel модель эффекта источника молнии
	// @arg string effectCasterAttach точка прикрепления эффекта источника молнии
	// @arg string effectTargetModel модель эффекта цели молнии
	// @arg string effectTargetAttach точка прикрепления эффекта цели молнии
	// @arg real duration время жизни молнии
	// @arg real maxDistance максимальная дистанция молнии
	// @arg real lightningZ высота молнии над землёй
	// @arg real decayTime время затухания молнии
	// @arg boolean destroyEffects уничтожать ли эффекты молнии
	// @return integer идентификатор молнии
	native CreateUnitLightningTarget takes unit caster, unit target, string lightningType, string effectCasterModel, string effectCasterAttach, string effectTargetModel, string effectTargetAttach, real duration, real maxDistance, real lightningZ, real decayTime, boolean destroyEffects returns integer //! [Unit], TriggerActions, TriggerCalls

	//==================================
	//=========== MOVE SPEED ===========
	native GetMSUnit takes nothing returns unit //! [ResponseMoveSpeed], TriggerCalls
	native GetMSBonus takes nothing returns real //! [ResponseMoveSpeed], TriggerCalls
	native GetMSPenalty takes nothing returns real //! [ResponseMoveSpeed], TriggerCalls
	native GetMSIncrease takes nothing returns real //! [ResponseMoveSpeed], TriggerCalls
	native GetMSDecrease takes nothing returns real //! [ResponseMoveSpeed], TriggerCalls
	native GetMSMinCap takes nothing returns real //! [ResponseMoveSpeed], TriggerCalls
	native GetMSMaxCap takes nothing returns real //! [ResponseMoveSpeed], TriggerCalls
	native GetMSSlowResist takes nothing returns real //! [ResponseMoveSpeed], TriggerCalls
	native AddMSBonus takes real v returns nothing //! [RequestMoveSpeed], TriggerActions
	native AddMSPenalty takes real v returns nothing //! [RequestMoveSpeed], TriggerActions
	native AddMSIncrease takes real v returns nothing //! [RequestMoveSpeed], TriggerActions
	native AddMSDecrease takes real v returns nothing //! [RequestMoveSpeed], TriggerActions
	native AddMSSlowResist takes real v returns nothing //! [RequestMoveSpeed], TriggerActions
	native AddMSCap takes real cap, boolean isMin returns nothing //! [RequestMoveSpeed], TriggerActions

	// Обновляет скорость перемещения юнита
	// @arg unit whichUnit целевой юнит
	// @return real скорость перемещения юнита
	native UpdateUnitMoveSpeed takes unit whichUnit returns real //! [Unit], TriggerCalls

	//==============================
	//=========== PICKUP ===========

	// Делает предмет подбираемым
	// @arg unit pickup предмет, который будет подобран
	// @return Pickup инстанс поведения
	native MakePickupable takes unit pickup returns Pickup //! [Unit], TriggerActions, TriggerCalls
	native GetPickedUpUnit takes nothing returns unit //! [ResponsePickUp], TriggerCalls
	native GetPickingUnit takes nothing returns unit //! [ResponsePickUp], TriggerCalls

	//====================================
	//=========== REGENERATION ===========
	native GetRegenModifierUnit takes nothing returns unit //! [ResponseRegenModifier], TriggerCalls
	native GetRegenModifierFlat takes nothing returns real //! [ResponseRegenModifier], TriggerCalls
	native GetRegenModifierPenalty takes nothing returns real //! [ResponseRegenModifier], TriggerCalls
	native GetRegenModifierIncrease takes nothing returns real //! [ResponseRegenModifier], TriggerCalls
	native GetRegenModifierDecrease takes nothing returns real //! [ResponseRegenModifier], TriggerCalls
	native GetRegenModifierCap takes nothing returns real //! [ResponseRegenModifier], TriggerCalls
	native AddRegenModifierFlat takes real regenFlat returns nothing //! [RequestRegenModifier], TriggerActions
	native AddRegenModifierPenalty takes real regenPenalty returns nothing //! [RequestRegenModifier], TriggerActions
	native AddRegenModifierIncrease takes real regenIncrease returns nothing //! [RequestRegenModifier], TriggerActions
	native AddRegenModifierDecrease takes real regenDecrease returns nothing //! [RequestRegenModifier], TriggerActions
	native AddRegenModifierCap takes real regenCap returns nothing //! [RequestRegenModifier], TriggerActions
	native SetRegenModifierFlat takes real regenFlat returns nothing //! [RequestRegenModifier], TriggerActions
	native SetRegenModifierPenalty takes real regenPenalty returns nothing //! [RequestRegenModifier], TriggerActions
	native SetRegenModifierIncrease takes real regenIncrease returns nothing //! [RequestRegenModifier], TriggerActions
	native SetRegenModifierDecrease takes real regenDecrease returns nothing //! [RequestRegenModifier], TriggerActions
	native SetRegenModifierCap takes real regenCap returns nothing //! [RequestRegenModifier], TriggerActions
	native GetRegenUnit takes nothing returns unit //! [ResponseRegen], TriggerCalls
	native GetRegenValue takes nothing returns real //! [ResponseRegen], TriggerCalls

	// Возвращает текущее значение регенерации HP юнита (без перерасчёта).
	// @arg unit whichUnit — целевой юнит
	// @return real — скорость регенерации здоровья
	native GetUnitHpRegen takes unit whichUnit returns real //! [Unit], TriggerCalls

	// Возвращает текущее значение регенерации HP юнита (без перерасчёта).
	// @arg unit whichUnit — целевой юнит
	// @return real — скорость регенерации здоровья
	native GetUnitMpRegen takes unit whichUnit returns real //! [Unit], TriggerCalls

	// Обновляет регенерацию HP юнита и возвращает новое значение.
	// @arg unit whichUnit — целевой юнит
	// @return real — новая скорость регенерации здоровья
	native UpdateUnitHpRegen takes unit whichUnit returns real //! [Unit], TriggerCalls, TriggerActions

	// Обновляет регенерацию MP юнита и возвращает новое значение.
	// @arg unit whichUnit — целевой юнит
	// @return real — новая скорость регенерации маны
	native UpdateUnitMpRegen takes unit whichUnit returns real //! [Unit], TriggerCalls, TriggerActions

	//=====================================
	//=========== SPELL GETTERS ===========

	// Getters Functions
	native GetSpellObject takes nothing returns integer //! [ResponseSpell], TriggerCalls
	native GetSpellOwnerUnit takes nothing returns unit //! [ResponseSpell], TriggerCalls
	native GetSpellDummyUnit takes nothing returns unit //! [ResponseSpell], TriggerCalls
	native GetSpellTargUnit takes nothing returns unit //! [ResponseSpell], TriggerCalls
	native GetSpellIsEntered takes nothing returns boolean //! [ResponseSpell], TriggerCalls
	native GetSpellIsOut takes nothing returns boolean //! [ResponseSpell], TriggerCalls
	native GetSpellActionsId takes nothing returns integer //! [ResponseSpell], TriggerCalls
	native GetSpellCompletion takes nothing returns real //! [ResponseSpell], TriggerCalls
	native GetSpellCountTargets takes nothing returns integer //! [ResponseSpell], TriggerCalls
	native GetSpellIsFocused takes nothing returns boolean //! [ResponseSpell], TriggerCalls
	native GetSpellX takes nothing returns real //! [ResponseSpell], TriggerCalls
	native GetSpellY takes nothing returns real //! [ResponseSpell], TriggerCalls
	native GetSpellIsBounce takes nothing returns boolean //! [ResponseSpell], TriggerCalls
	native GetSpellIsStopped takes nothing returns boolean //! [ResponseSpell], TriggerCalls
	native GetSpellIsCollide takes nothing returns boolean //! [ResponseSpell], TriggerCalls

	//==========================================
	//=========== STATIC PROJECTILES ===========
	native CreateStaticProjectile takes unit owner, unit target, unit projectile, integer actionsId, real speed, real maxHeight, real offsetZ, boolean canFocusLost returns StaticProjectile //! [Projectile], TriggerActions, TriggerCalls
	native CreateStaticProjectileFunc takes integer object, unit owner, unit target, unit projectile, string func, real speed, real maxHeight, real offsetZ, boolean canFocusLost returns StaticProjectile //! [Projectile], TriggerActions, TriggerCalls
	native CreateStaticProjectileAtFunc takes integer object, unit owner, real x, real y, unit projectile, string func, real speed, real maxHeight, real offsetZ returns StaticProjectile //! [Projectile], TriggerActions, TriggerCalls

	//=============================
	//=========== STUNS ===========

	// Event Getters
	native GetTriggerStun takes nothing returns Stun //! [ResponseStun], TriggerCalls
	native GetStunningUnit takes nothing returns unit //! [ResponseStun], TriggerCalls
	native GetStunnedUnit takes nothing returns unit //! [ResponseStun], TriggerCalls
	native GetStunTypeId takes nothing returns integer //! [ResponseStun], TriggerCalls
	native GetStunDuration takes nothing returns real //! [ResponseStun], TriggerCalls
	native GetStunIsEnter takes nothing returns boolean //! [ResponseStun], TriggerCalls
	native GetStunIsOut takes nothing returns boolean //! [ResponseStun], TriggerCalls
	native GetStunIsFirst takes nothing returns boolean //! [ResponseStun], TriggerCalls

	// Возвращает оставшееся время оглушения.
	//
	// @arg Stun `whichStun` оглушение.
	// @return real время оглушения.
	native GetStunRemainingTime takes Stun whichStun returns real //! [Stun], TriggerCalls

	// Возвращает оставшееся время оглушения указанного типа оглушения для юнита.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @arg integer `typeId` тип оглушения.
	// @return real время оглушения.
	native GetStunRemainingTimeByType takes unit stunned, integer typeId returns real //! [Stun], TriggerCalls

	// Проверяет, оглушен ли юнит исключая указанный тип оглушения.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @arg integer `typeId` исключаемый тип оглушения.
	// @return boolean `true` - если юнит оглушен исключая указанный тип, иначе - `false`.
	native IsUnitStunnedExceptType takes unit stunned, integer typeId returns boolean //! [Stun], TriggerCalls

	// Проверяет, оглушен ли юнит указанным типом оглушения.
	//
	// @arg unit `stunned` проверяемый юнит.
	// @arg integer `typeId` указанный тип оглушения.
	// @return boolean `true`, если юнит оглушен указанным типом, иначе `false`.
	native IsUnitStunnedByType takes unit stunned, integer typeId returns boolean //! [Stun], TriggerCalls

	// Проверяет, оглушен ли юнит.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @return boolean `true` - если юнит оглушен, иначе - `false`.
	native IsUnitStunned takes unit stunned returns boolean //! [Stun], TriggerCalls

	// Проверяет, реально оглушен ли юнит.
	//
	// @arg unit `stunned` оглушенный юнит.
	// @return boolean `true` - если юнит оглушен, иначе - `false`.
	native IsUnitActuallyStunned takes unit stunned returns boolean //! [Stun], TriggerCalls

	// Удаляет оглушение указанного типа у юнита.
	//
	// @arg unit `stunned` юнит, у которого нужно удалить оглушение.
	// @arg integer `typeId` тип оглушения для удаления.
	native RemoveUnitStunByType takes unit stunned, integer typeId returns nothing //! [Stun], TriggerActions

	// Удаляет все оглушения у юнита.
	//
	// @arg unit `stunned` юнит, у которого нужно удалить все оглушения.
	native RemoveUnitStun takes unit stunned returns nothing //! [Stun], TriggerActions

	// Возвращает объект оглушения указанного типа для юнита.
	//
	// @arg unit `stunned` юнит, у которого нужно получить оглушение.
	// @arg integer `typeId` тип оглушения который нужно получить.
	// @return object|0, `Stun` - оглушение указанного типа, или 0 - если такого оглушения нет.
	native GetUnitStunByType takes unit stunned, integer typeId returns Stun //! [Stun], TriggerCalls

	// Оглушает юнита на указанное время с учетом различных условий и модификаторов.
	//
	// @arg unit `stunningUnit` юнит, инициировавший оглушение.
	// @arg unit `stunnedUnit` целевой юнит, который нужно оглушить.
	// @arg integer `typeId` тип оглушения.
	// @arg real `duration` длительность оглушения.
	// @return object|0, `Stun` - возвращает объект оглушения, созданный или обновленный в результате выполнения функции, или 0 при отсутствии оглушения.
	//
	// Функция проверяет жив ли целевой юнит, имеет ли он иммунитет к оглушению и соответствует ли длительность нового оглушения текущему оглушению. Основываясь на этих проверках, функция либо создает новый объект оглушения, либо обновляет существующий.
	native StunUnit takes unit stunningUnit, unit stunnedUnit, integer typeId, real duration returns Stun //! [Stun], TriggerActions, TriggerCalls

	//======================================
	//=========== SUMMATIVE TEXT ===========

	// Добавляет суммирующий текст к юниту для игрока
	// @arg player owner игрок, которому будет показан суммирующий текст
	// @arg unit target юнит, к которому будет добавлен суммирующий текст
	// @arg integer textType тип суммирующего текста
	// @arg real value значение суммирующего текста
	// @arg string prefix префикс суммирующего текста
	// @return SummativeText созданный суммирующий текст
	native AddSummativeTextToUnitForPlayer takes player owner, unit target, integer textType, real value, string prefix returns SummativeText //! [TextTag], TriggerActions, TriggerCalls

	// Показывает суммирующий текст для игрока
	// @arg SummativeText summativeText суммирующий текст, который нужно показать
	// @arg player participant игрок, которому нужно показать суммирующий текст
	// @return SummativeText суммирующий текст, который был показан
	native ShowSummativeTextToPlayer takes SummativeText summativeText, player participant returns nothing //! [TextTag], TriggerActions

	//==============================
	//=========== TALENT ===========
	native GetTalentHero takes nothing returns unit //! [ResponseTalent], TriggerCalls

	//==================================
	//=========== TECH UTILS ===========

	// Делает юнита летающим
	// @arg unit u
	// @return unit возвращает юнит, который стал летающим
	native MakeUnitFly takes unit u returns unit //! [Unit], TriggerActions, TriggerCalls

	// Проверяет, находится ли точка за пределами карты
	// @arg real x координата X
	// @arg real y координата Y
	// @return boolean true, если точка находится за пределами карты
	native IsCoordsOut takes real x, real y returns boolean //! [Geometry], TriggerCalls

	// Проверяет, неуявзим ли юнит
	// @arg unit u юнит, который нужно проверить
	// @return boolean true, если юнит неуязвим
	native IsUnitInvulnerable takes unit u returns boolean //! [Unit], TriggerCalls

	// Перебирает все юниты в радиусе с учётом их коллизии
	// @arg group whichGroup группа, в которую будут добавлены юниты
	// @arg real x координата X
	// @arg real y координата Y
	// @arg real r радиус
	// @arg boolexpr filter фильтр для юнитов
	native GroupEnumUnitsInRangeFiz takes group whichGroup, real x, real y, real r, boolexpr filter returns nothing //! [Group], TriggerActions

	// Устанавливает время жизни для эффекта
	// @arg effect eff эффект
	// @arg real endTime время жизни
	native EffectApplyTimedLife takes effect eff, real endTime returns nothing //! [Effect], TriggerActions

	// Устанавливает время жизни для юнита
	// @arg unit u юнит
	// @arg real endTime время жизни
	// @return unit
	native UnitApplyTimeLife takes unit u, real endTime returns unit //! [Unit], TriggerActions

	// Устанавливает время жизни для юнита с скрытием
	// @arg unit u юнит
	// @arg real endTime время жизни
	// @return unit
	native UnitApplyTimeLifeHide takes unit u, real endTime returns nothing //! [Unit], TriggerActions

	// Применяет способность в точку
	// @arg unit whichUnit юнит, который применяет способность
	// @arg real x координата X
	// @arg real y координата Y
	// @arg integer abilityId ID способности
	// @arg integer abilityLvl уровень способности
	// @arg string order строка с приказом
	native ApplyAbility takes unit whichUnit, real x, real y, integer abilityId, integer abilityLvl, string order returns nothing //! [Unit], TriggerActions

	// Применяет способность к юниту
	// @arg unit whichUnit юнит, который применяет способность
	// @arg unit targetUnit юнит, к которому применяется способность
	// @arg integer abilityId ID способности
	// @arg integer abilityLvl уровень способности
	// @arg string order строка с приказом
	native ApplyAbilityToUnit takes unit whichUnit, unit targetUnit, integer abilityId, integer abilityLvl, string order returns nothing //! [Unit], TriggerActions

	// Атаковать юнита с помощью дамми-юнита
	// @arg player whichPlayer игрок, которому принадлежит дамми-юнит
	// @arg unit targetUnit юнит, которого атакуем
	// @arg integer abilityId ID способности
	// @arg integer abilityLvl уровень способности
	// @return unit возвращает дамми-юнит
	native DummyAttackUnit takes player whichPlayer, unit targetUnit, integer abilityId, integer abilityLvl returns unit //! [Unit], TriggerActions, TriggerCalls

	// Проверяет, есть ли у юнита предмет с данного типа
	native UnitHasItemType takes unit whichUnit, integer itemId returns boolean //! [Unit], TriggerCalls

	// Подсчитывает количество предметов данного типа у юнита
	native CountUnitItemType takes unit whichUnit, integer itemId returns integer //! [Unit], TriggerCalls

	// Запускает звук для игрока
	// @arg sound snd звук, который нужно запустить
	// @arg player pl игрок, для которого запускаем звук
	native StartSoundToPlayer takes sound snd, player pl returns nothing //! [Sound], TriggerActions

	// Возвращает цвет игрока в виде строки
	// @arg player whichplayer игрок, для которого получаем цвет
	// @return string цвет игрока в виде шестнадцатеричной строки
	native GetPlayerTextColor takes player whichplayer returns string //! [Player], TriggerCalls

	// Добавляет способность юниту и делает её постоянной
	native UnitAddAbilityPermanent takes unit u, integer aId returns nothing //! [Unit], TriggerActions

	// Проверяет, есть ли у юнита способность
	native UnitHasAbility takes unit whichUnit, integer abilityId returns boolean //! [Unit], TriggerCalls

	// Проверяет, находится ли юнит под хексом
	native IsUnitHexed takes unit u returns boolean //! [Unit], TriggerCalls

	// Безопасно вручает руну юниту
	// @arg unit u юнит
	// @arg integer id ID руны
	// @return boolean true, если руна успешно вручена
	native UnitAddPowerUpItem takes unit u, integer id returns boolean //! [Unit], TriggerActions

	// Проверяет, есть ли у юнита талант
	native UnitHasTalent takes unit whichUnit, integer talentId returns boolean //! [Unit], TriggerCalls

	// Возвращает уровень таланта у юнита
	native GetUnitTalentLvl takes unit whichUnit, integer talentId returns integer //! [Unit], TriggerCalls

	// Проверяет, есть ли у юнита Мефисто
	native UnitHasMefisto takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	// Возвращает процент жизни юнита
	native GetUnitLifePerc takes unit whichUnit returns real //! [Unit], TriggerCalls

	// Делает юнит неуязвимым
	// @arg unit whichUnit
	// @arg boolean flag true, если нужно сделать юнит неуязвимым, false - если нужно снять неуязвимость
	native MakeUnitInvulnerable takes unit whichUnit, boolean flag returns nothing //! [Unit], TriggerActions

	// Проверяет, включен ли командный режим
	native IsTeamMode takes nothing returns boolean //! [Game], TriggerCalls

	// Возвращает игрока-мастера команды
	native GetTeamMasterPlayer takes player whichPlayer returns player //! [Player], TriggerCalls

	// Проверяет, находится ли игра в паузе
	native IsMapPaused takes nothing returns boolean //! [Game], TriggerCalls

	// Проверяет, активна ли дуэль
	native IsMapDuel takes nothing returns boolean //! [Game], TriggerCalls

	// Проверяет, является ли юнит даммиком
	// @arg unit whichUnit
	// @return boolean
	native IsUnitDummy takes unit whichUnit returns boolean //! [Unit], TriggerCalls

	// Возвращает группу игроков-наблюдателей дуэли
	native GetObserverForce takes nothing returns force //! [Force], TriggerCalls

	//=====================================
	//=========== TEXTTAG UTILS ===========

	// Создает тексттаг над юнитом с анимацией по параболе
	// @arg unit u юнит, к которому привязывается текст
	// @arg string s текст
	// @arg real sizeMin минимальный размер
	// @arg real sizeBonus добавочный размер (влияет на синусоиду)
	// @arg real timeLife время жизни
	// @arg real timeFade время затухания
	// @arg real zOffset высота над юнитом
	// @arg real lowSpeed минимальная скорость
	// @arg real maxSpeed максимальная скорость
	// @arg real lowAngle минимальный угол
	// @arg real maxAngle максимальный угол
	native CreateFlyingTextToUnit takes unit u, string s, real sizeMin, real sizeBonus, real timeLife, real timeFade, real zOffset, real lowSpeed, real maxSpeed, real lowAngle, real maxAngle returns nothing //! [TextTag], TriggerActions

	// Создаёт тексттаг с заданной скоростью и смещением, не зависящий от углов и случайностей
	// @arg unit target юнит, около которого появляется текст
	// @arg string text текст
	// @arg real lifespan продолжительность жизни
	// @arg real size размер
	// @arg real fadepoint точка начала исчезновения
	// @arg real velocity вертикальная скорость (вверх)
	// @arg real OffsetX смещение по X
	// @arg real OffsetY смещение по Y
	// @arg real OffsetZ смещение по Z
	native CreateCustomVelTextToUnit takes unit target, string text, real lifespan, real size, real fadepoint, real velocity, real OffsetX, real OffsetY, real OffsetZ returns nothing //! [TextTag], TriggerActions

	//=================================
	//=========== UNIT DATA ===========
	native Unit takes unit whichUnit returns UnitData //! [UnitData], TriggerCalls

	//====================================
	//=========== UNIT UNSTUCK ===========

	// Проверяет, застрял ли юнит, и пытается его "вытолкнуть" на ближайшую проходимую точку
	// Проводит круговой обход по растущим радиусам вокруг юнита и телепортирует его в первую подходящую проходимую точку
	native CheckAndFreeUnit takes unit u returns nothing //! [Unit], TriggerActions

	//====================================
	//=========== HASH CLEANER ===========
	native GetTriggerHandleId takes nothing returns integer //! [ResponseHash], TriggerCalls

	//===================================
	//=========== COORD UTILS ===========

	// Устанавливает позицию юнита с учетом возможных смещений, чтобы избежать резких скачков.
	//
	// @arg unit `source` юнит, позицию которого нужно установить.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	native SetUnitPositionSmooth takes unit source, real x, real y returns nothing //! [Unit], TriggerActions

	// Вычисляет смещение координаты X на основе заданного расстояния и угла от точки.
	//
	// @arg real `x` начальная координата x.
	// @arg real `distance` расстояние от начальной точки.
	// @arg real `angle` угол в градусах.
	// @return real - результирующая координата x после применения полярного смещения.
	native GetPolarOffsetX takes real x, real distance, real angle returns real //! [Geometry], TriggerCalls

	// Вычисляет смещение координаты Y на основе заданного расстояния и угла от точки.
	//
	// @arg real `y` начальная координата y.
	// @arg real `distance` расстояние от начальной точки.
	// @arg real `angle` угол в градусах.
	// @return real - результирующая координата y после применения полярного смещения.
	native GetPolarOffsetY takes real y, real distance, real angle returns real //! [Geometry], TriggerCalls

	// Перемещает локацию на новую позицию на основе полярного смещения от ее текущей позиции.
	//
	// @arg location `target` локация для перемещения.
	// @arg real `distance` расстояние для перемещения локации.
	// @arg real `angle` угол в градусах для перемещения локации.
	native MoveLocationPolar takes location target, real distance, real angle returns nothing //! [Geometry], TriggerActions

	// Перемещает юнита на новую позицию на основе полярного смещения от его текущей позиции.
	//
	// @arg unit `target` юнит для перемещения.
	// @arg real `distance` расстояние для перемещения юнита.
	// @arg real `angle` угол в градусах для перемещения юнита.
	native SetUnitPositionPolar takes unit target, real distance, real angle returns nothing //! [Unit], TriggerActions

	// Вычисляет угол между двумя наборами координат.
	//
	// @arg real `x1`, `y1` координаты первой точки.
	// @arg real `x2`, `y2` координаты второй точки.
	// @return real - угол в градусах между двумя точками.
	native AngleBetweenCoords takes real x1, real y1, real x2, real y2 returns real //! [Geometry], TriggerCalls

	// Вычисляет 2D расстояние между двумя наборами координат.
	//
	// @arg real `x1`, `y1` координаты первой точки.
	// @arg real `x2`, `y2` координаты второй точки.
	// @return real - расстояние между двумя наборами координат.
	native DistanceBetweenCoords takes real x1, real y1, real x2, real y2 returns real //! [Geometry], TriggerCalls

	// Вычисляет 3D расстояние между двумя наборами координат.
	//
	// @arg real `x1`, `y1`, `z1` координаты первой точки.
	// @arg real `x2`, `y2`, `z2` координаты второй точки.
	// @return real - 3D расстояние между двумя наборами координат.
	native DistanceBetweenCoords3D takes real x1, real y1, real z1, real x2, real y2, real z2 returns real //! [Geometry], TriggerCalls

	// Вычисляет расстояние между двумя юнитами.
	//
	// @arg unit `target1` первый юнит.
	// @arg unit `target2` второй юнит.
	// @return real - расстояние между двумя юнитами.
	native DistanceBetweenUnits takes unit target1, unit target2 returns real //! [Geometry], TriggerCalls

	// Вычисляет угол между двумя юнитами.
	//
	// @arg unit `target1` первый юнит.
	// @arg unit `target2` второй юнит.
	// @return real - угол в градусах между двумя юнитами.
	native AngleBetweenUnits takes unit target1, unit target2 returns real //! [Geometry], TriggerCalls

	// Получает высоту местности по заданным координатам.
	//
	// @arg real `x`, `y` координаты, для которых нужно получить высоту местности.
	// @return real - высота местности по заданным координатам.
	native GetTerrainZ takes real x, real y returns real //! [Geometry], TriggerCalls
	native GetUnitTerrainCliffLevel takes unit target returns integer //! [Geometry], TriggerCalls

	// Получает общую высоту (высота местности + высота полета) юнита.
	//
	// @arg unit `target` целевой юнит.
	// @return real - общая высота юнита на его текущей позиции.
	native GetUnitZ takes unit target returns real //! [Unit], TriggerCalls

	// Устанавливает высоту полета для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить высоту.
	// @arg real `z` новая высота полета.
	// @return unit - возвращает тот же юнит после установки новой высоты.
	native SetUnitZ takes unit target, real z returns unit //! [Unit], TriggerActions

	// Устанавливает координаты X и Y для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить координаты.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	// @return unit - возвращает тот же юнит после установки новых координат.
	native SetUnitXY takes unit target, real x, real y returns unit //! [Unit], TriggerActions

	// Устанавливает координаты X, Y и высоту полета Z для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить координаты и высоту.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	// @arg real `z` новая высота полета.
	// @return unit - возвращает тот же юнит после установки новых параметров.
	native SetUnitXYZ takes unit target, real x, real y, real z returns unit //! [Unit], TriggerActions

	// Устанавливает координаты X, Y, высоту полета Z и направление (угол поворота) для указанного юнита.
	//
	// @arg unit `target` юнит, которому необходимо установить параметры.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	// @arg real `z` новая высота полета.
	// @arg real `f` новое направление (угол поворота в градусах).
	// @return unit - возвращает тот же юнит после установки новых параметров.
	native SetUnitXYZF takes unit target, real x, real y, real z, real f returns unit //! [Unit], TriggerActions

	// Находит длину перпендикуляра от отрезка, заданного Xa, Ya, Xb, Yb к точке, заданной Xc, Yc.
	// https://xgm.guru/p/wc3/perpendicular
	//
	// @arg real `Xa` координата X первой точки отрезка.
	// @arg real `Ya` координата Y первой точки отрезка.
	// @arg real `Xb` координата X второй точки отрезка.
	// @arg real `Yb` координата Y второй точки отрезка.
	// @arg real `Xc` координата X точки C.
	// @arg real `Yc` координата Y точки C.
	// @return real - возвращает длину перпендикуляра от точки C к отрезку AB.
	native Perpendicular takes real Xa, real Ya, real Xb, real Yb, real Xc, real Yc returns real //! [Geometry], TriggerCalls

	// Вычисляет разницу между двумя углами.
	// https://xgm.guru/p/wc3/warden-math
	//
	// @arg real `a1` первый угол в градусах.
	// @arg real `a2` второй угол в градусах.
	// @return real - возвращает абсолютное значение разницы между двумя углами.
	native AngleDifference takes real a1, real a2 returns real //! [Geometry], TriggerCalls

	// Нормализует угол, приводя его к диапазону [0, 360).
	//
	// @arg real `angle` угол для нормализации.
	// @return real - возвращает нормализованный угол.
	native AngleNormalize takes real angle returns real //! [Geometry], TriggerCalls
	native AngleTowards takes real angle, real toAngel, real angleOffset returns real //! [Geometry], TriggerCalls

	// Проверяет, находятся ли координаты внутри треугольника.
	//
	// @arg real `x, y` координаты точки для проверки.
	// @arg real `x1, y1, x2, y2, x3, y3` координаты вершин треугольника.
	// @return boolean - возвращает true, если точка внутри треугольника, иначе false.
	native IsCoordsInTriangle takes real x, real y, real x1, real y1, real x2, real y2, real x3, real y3 returns boolean //! [Geometry], TriggerCalls

	// Проверяет, находятся ли координаты внутри четырехугольника с использованием простого метода.
	//
	// @arg real `x, y` координаты точки для проверки.
	// @arg real `x1, y1, x2, y2, x3, y3, x4, y4` координаты вершин четырехугольника.
	// @return boolean - возвращает true, если точка внутри четырехугольника, иначе false.
	native IsCoordsIn4GonSimple takes real x, real y, real x1, real y1, real x2, real y2, real x3, real y3, real x4, real y4 returns boolean //! [Geometry], TriggerCalls

	// Проверяет, находятся ли координаты внутри четырехугольника.
	//
	// @arg real `x, y` координаты точки для проверки.
	// @arg real `x1, y1, x2, y2, x3, y3, x4, y4` координаты вершин четырехугольника.
	// @return boolean - возвращает true, если точка внутри четырехугольника, иначе false.
	native IsCoordsIn4Gon takes real x, real y, real x1, real y1, real x2, real y2, real x3, real y3, real x4, real y4 returns boolean //! [Geometry], TriggerCalls

	//=============================
	//=========== DEBUG ===========

	// Отладка на уровне "info": общая информация.
	// @arg string msg сообщение для логирования
	native Debug takes string msg returns nothing //! [Debug], TriggerActions

	// Показать текстовую метку в координатах, полезно для отладки
	// @arg string s текст для отображения
	// @arg real x позиция по X
	// @arg real y позиция по Y
	native DebugXY takes string s, real x, real y returns nothing //! [Debug], TriggerActions

	// Отладка на уровне "warning": потенциальные проблемы.
	// @arg string id идентификатор предупреждения
	// @arg string msg сообщение предупреждения
	native Warning takes string id, string msg returns nothing //! [Debug], TriggerActions

	// Отладка на уровне "error": серьёзные ошибки.
	// @arg string id идентификатор ошибки
	// @arg string msg подробное сообщение об ошибке
	native Error takes string id, string msg returns nothing //! [Debug], TriggerActions

	//=====================================
	//=========== NEGATE DAMAGE ===========

	// Возвращает максимальное здоровье юнита
	// @arg unit u юнит, для которого нужно получить максимальное здоровье
	// @return real максимальное здоровье юнита
	native GetUnitMaxLife takes unit u returns real //! [Unit], TriggerCalls

	// Возвращает значение состояния юнита
	// @arg unit u юнит, для которого нужно получить значение состояния
	// @arg unitstate state значение состояния юнита
	// @return real значение состояния юнита
	native GetUnitStateHook takes unit u, unitstate state returns real //! [Unit], TriggerCalls

	// Возвращает процент состояния юнита
	// @arg unit whichUnit юнит, для которого нужно получить процент состояния
	// @arg unitstate whichState состояние юнита
	// @arg unitstate whichMaxState максимальное состояние юнита
	// @return real процент состояния юнита
	native GetUnitStatePercentHook takes unit whichUnit, unitstate whichState, unitstate whichMaxState returns real //! [Unit], TriggerCalls

	// Возвращает процент здоровья юнита
	// @arg unit whichUnit юнит, для которого нужно получить процент здоровья
	// @return real процент здоровья юнита
	native GetUnitLifePercentHook takes unit whichUnit returns real //! [Unit], TriggerCalls

	//=================================
	//=========== RECTANGLE ===========

	// Перебирает все юниты в прямоугольнике с учётом коллизии
	// @arg group whichGroup группа, в которую будут добавлены юниты
	// @arg real centerX координата центра прямоугольника по X
	// @arg real centerY координата центра прямоугольника по Y
	// @arg real width ширина прямоугольника
	// @arg real height высота прямоугольника
	// @arg real radians угол поворота прямоугольника в радианах
	// @arg boolexpr filter фильтр для юнитов, которые будут добавлены в группу
	native GroupEnumUnitsInRectangleCollision takes group whichGroup, real centerX, real centerY, real width, real height, real radians, boolexpr filter returns nothing //! [Group], TriggerActions

	//==========================================
	//=========== SET UNIT MAX STATE ===========

	// Устанавливает максимальное значение состояния юнита
	// @arg unit whichUnit юнит, для которого нужно установить максимальное состояние
	// @arg unitstate whichUnitState состояние юнита
	// @arg integer newVal новое значение состояния юнита
	// @return boolean true, если состояние было успешно установлено
	native SetUnitMaxState takes unit whichUnit, unitstate whichUnitState, integer newVal returns boolean //! [Unit], TriggerActions, TriggerCalls
	native AddUnitSight takes unit whichUnit, integer newVal returns boolean //! [Unit], TriggerActions, TriggerCalls

	//==================================
	//=========== SMART LOOP ===========

	// Инициализирует цикл с заданным начальным и конечным значением
	// @arg integer start начальное значение цикла
	// @arg integer end конечное значение цикла
	native InitSmartLoop takes integer start, integer end returns nothing //! [Common], TriggerActions

	// Возвращает текущий индекс цикла
	// @return integer текущий индекс цикла
	native GetSmartLoopIndex takes nothing returns integer //! [ResponseCommon], TriggerCalls

	// Возвращает конечный индекс цикла
	// @return integer конечный индекс цикла
	native GetSmartLoopIndexEnd takes nothing returns integer //! [ResponseCommon], TriggerCalls

	// Увеличивает текущий индекс цикла на заданное значение
	// @arg integer step шаг увеличения индекса
	native PlusSmartLoopIndex takes integer step returns nothing //! [Common], TriggerActions

	// Конец цикла
	native EndSmartLoop takes nothing returns nothing //! [Common], TriggerActions
