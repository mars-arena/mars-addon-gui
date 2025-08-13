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
	native GetASUnit takes nothing returns unit //! [EventResponse], TriggerCalls
	native GetASBonus takes nothing returns real //! [EventResponse], TriggerCalls
	native GetASPenalty takes nothing returns real //! [EventResponse], TriggerCalls
	native GetASIncrease takes nothing returns real //! [EventResponse], TriggerCalls
	native GetASDecrease takes nothing returns real //! [EventResponse], TriggerCalls
	native AddASBonus takes real asBonus returns nothing //! [EventRequest], TriggerActions, TriggerCalls
	native AddASPenalty takes real asPenalty returns nothing //! [EventRequest], TriggerActions, TriggerCalls
	native AddASIncrease takes real asIncrease returns nothing //! [EventRequest], TriggerActions, TriggerCalls
	native AddASDecrease takes real asDecrease returns nothing //! [EventRequest], TriggerActions, TriggerCalls
	native SetASBonus takes real asBonus returns nothing //! [EventRequest], TriggerActions, TriggerCalls
	native SetASPenalty takes real asPenalty returns nothing //! [EventRequest], TriggerActions, TriggerCalls
	native SetASIncrease takes real asIncrease returns nothing //! [EventRequest], TriggerActions, TriggerCalls
	native SetASDecrease takes real asDecrease returns nothing //! [EventRequest], TriggerActions, TriggerCalls

	//==============================
	//=========== EVENTS ===========

	// Регистрирует действие на указанное событие
	// Автоматически вешает `code` на единый триггер для всех игроков
	// @arg integer eventId - ID события (GetHandleId(EVENT_PLAYER_...) или кастомный ивент (EVENT_AURA_...))
	// @arg code action - функция, которую нужно выполнят при срабатывании события
	// @return triggeraction - ссылка на зарегистрированное действие
	native EventRegisterAction takes integer eventId, code action returns triggeraction //! [EventHandlers], TriggerActions, TriggerCalls

	// Регистрирует GUI-триггер на указанное событие (со всеми его условиями/действиями).
	// Работает и для системных EVENT_GAME/PLAYER/PLAYER_UNIT, и для кастомных CreateEvent().
	// @arg trigger trg триггер из GUI (или созданный кодом), который должен срабатывать на eventId
	// @arg integer eventId ID события
	native EventRegisterTrigger takes trigger trg, integer eventId returns nothing //! [EventHandlers], TriggerEvents
