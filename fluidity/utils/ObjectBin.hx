
package fluidity.utils;

import haxe.ds.ObjectMap;

class ObjectBin<K:{ },V> {

    public var binMap:ObjectMap<K,V> = new ObjectMap<K,V>();

    public var instantiator:K->V;

    public function new(f:K->V)
    {
        instantiator = f;
    }

    public inline function get(name:K) {
        if(name == null)
        {
            trace(binMap);
        }
        if(binMap.exists(name))
        {
            return binMap.get(name);
        }
        else
        {
            var obj = instantiator(name);
            binMap.set(name,obj);
            return obj;
        }
    }

    public inline function remove(key:K)
    {
        binMap.remove(key);
    }
}