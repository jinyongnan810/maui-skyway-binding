using Foundation;

namespace SkyWayMaciOS
{
	// @interface DotnetSkyWay : NSObject
	[BaseType(typeof(NSObject))]
	interface DotnetSkyWay
	{
		// +(NSString * _Nonnull)getStringWithMyString:(NSString * _Nonnull)myString __attribute__((warn_unused_result("")));
		[Static]
		[Export("getStringWithMyString:")]
		string GetString(string myString);
	}
}
