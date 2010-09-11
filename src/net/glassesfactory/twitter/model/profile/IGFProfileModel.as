/*////////////////////////////////////////////

GFTweet

Autor	YAMAGUCHI EIKICHI
(@glasses_factory)
Date	2010/09/11

Copyright 2010 glasses factory
http://glasses-factory.net

/*////////////////////////////////////////////

package net.glassesfactory.twitter.model.profile
{
	public interface IGFProfileModel
	{
		/**
		 * 名前
		 */
		function get name():String;
		function set name( value:String ):void;
		
		/**
		 * ユーザーID
		 */
		function get userName():String;
		function set userName(value:String):void;
		
		/**
		 * url
		 */
		function get url():String;
		function set url( value:String ):void;
		
		/**
		 * アイコンURL
		 */
		function get iconURL():String;
		function set iconURL( value:String ):void;
	}
}