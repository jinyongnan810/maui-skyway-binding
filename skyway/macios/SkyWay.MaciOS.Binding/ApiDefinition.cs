using Foundation;

namespace SkyWayMaciOS
{
	// @interface DotnetSkyWay : NSObject
	[BaseType(typeof(NSObject))]
	interface DotnetSkyWay
	{
		[Static]
		[Export("joinWithToken:roomId:userId:")]
		void join(string token, string roomId, string userId);

		[Static]
		[Export("leave")]
		void leave();
	}
}
