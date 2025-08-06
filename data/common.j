globals
	//=================================
	//=========== CONSTANTS ===========

	// максимальное количество игроков
	constant integer MAX_PLAYERS = 16

	//====================================
	//=========== HASH CLEANER ===========

	// Событие при очистке хэш-таблицы для юнита
	//
	// GetTriggerHandleId() -> integer
	constant integer EVENT_CLEAR_HASH = undefined

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
	constant integer EVENT_ATTACK_SPEED = undefined

endglobals

	//====================================
	//=========== HASH CLEANER ===========
	native GetTriggerHandleId takes nothing returns integer

	//===================================
	//=========== COORD UTILS ===========

	// Устанавливает позицию юнита с учетом возможных смещений, чтобы избежать резких скачков.
	//
	// @arg unit `source` юнит, позицию которого нужно установить.
	// @arg real `x` новая координата X.
	// @arg real `y` новая координата Y.
	native SetUnitPositionSmooth takes unit source, real x, real y returns nothing

	//====================================
	//=========== ATTACK SPEED ===========
	native GetASUnit takes nothing returns unit
	native GetASBonus takes nothing returns real
	native GetASPenalty takes nothing returns real
	native GetASIncrease takes nothing returns real
	native GetASDecrease takes nothing returns real
	native AddASBonus takes real asBonus returns nothing
	native AddASPenalty takes real asPenalty returns nothing
	native AddASIncrease takes real asIncrease returns nothing
	native AddASDecrease takes real asDecrease returns nothing
	native SetASBonus takes real asBonus returns nothing
	native SetASPenalty takes real asPenalty returns nothing
	native SetASIncrease takes real asIncrease returns nothing
	native SetASDecrease takes real asDecrease returns nothing

	native Penis takes real anal returns sperm
