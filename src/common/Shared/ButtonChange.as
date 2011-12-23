dynamic class Shared.ButtonChange extends gfx.events.EventDispatcher
{
	static var PLATFORM_PC: Number = 0;
	static var PLATFORM_PC_GAMEPAD: Number = 1;
	static var PLATFORM_360: Number = 2;
	static var PLATFORM_PS3: Number = 3;
	var iCurrPlatform = Shared.ButtonChange.PLATFORM_360;
	var dispatchEvent;

	function ButtonChange()
	{
		super();
		gfx.events.EventDispatcher.initialize(this);
	}

	function get Platform()
	{
		return this.iCurrPlatform;
	}

	function IsGamepadConnected()
	{
		return this.iCurrPlatform == Shared.ButtonChange.PLATFORM_PC_GAMEPAD || this.iCurrPlatform == Shared.ButtonChange.PLATFORM_360 || this.iCurrPlatform == Shared.ButtonChange.PLATFORM_PS3;
	}

	function SetPlatform(aSetPlatform, aSetSwapPS3)
	{
		this.iCurrPlatform = aSetPlatform;
		this.dispatchEvent({target: this, type: "platformChange", aPlatform: aSetPlatform, aSwapPS3: aSetSwapPS3});
	}

	function SetPS3Swap(aSwap)
	{
		this.dispatchEvent({target: this, type: "SwapPS3Button", Boolean: aSwap});
	}

}