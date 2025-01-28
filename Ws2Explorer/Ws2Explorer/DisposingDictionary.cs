using System.Collections;
using System.Diagnostics.CodeAnalysis;

namespace Ws2Explorer;

public sealed class DisposingDictionary<K, V> : IDictionary<K, V>, IDisposable
    where K : notnull
    where V : class
{
    private readonly Dictionary<K, V> dictionary = [];
    private bool disposedValue;

    public V this[K key]
    {
        get => dictionary[key];
        set
        {
            if (dictionary.TryGetValue(key, out var oldValue) && oldValue != value)
            {
                DisposeItem(oldValue);
            }
            dictionary[key] = value;
        }
    }

    public ICollection<K> Keys => dictionary.Keys;

    public ICollection<V> Values => dictionary.Values;

    public int Count => dictionary.Count;

    public bool IsReadOnly => ((ICollection<KeyValuePair<K, V>>)dictionary).IsReadOnly;

    public void Add(K key, V value)
    {
        dictionary.Add(key, value);
    }

    public void Add(KeyValuePair<K, V> item)
    {
        ((ICollection<KeyValuePair<K, V>>)dictionary).Add(item);
    }

    public void Clear()
    {
        foreach (var item in dictionary.Values)
        {
            DisposeItem(item);
        }
        dictionary.Clear();
    }

    public bool Contains(KeyValuePair<K, V> item)
    {
        return dictionary.Contains(item);
    }

    public bool ContainsKey(K key)
    {
        return dictionary.ContainsKey(key);
    }

    public void CopyTo(KeyValuePair<K, V>[] array, int arrayIndex)
    {
        ((ICollection<KeyValuePair<K, V>>)dictionary).CopyTo(array, arrayIndex);
    }

    public IEnumerator<KeyValuePair<K, V>> GetEnumerator()
    {
        return dictionary.GetEnumerator();
    }

    public bool Remove(K key)
    {
        if (dictionary.TryGetValue(key, out var value))
        {
            DisposeItem(value);
        }
        return dictionary.Remove(key);
    }

    public bool Remove(KeyValuePair<K, V> item)
    {
        if (dictionary.TryGetValue(item.Key, out var value))
        {
            DisposeItem(value);
        }
        return dictionary.Remove(item.Key);
    }

    public bool TryGetValue(K key, [MaybeNullWhen(false)] out V value)
    {
        return dictionary.TryGetValue(key, out value);
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return dictionary.GetEnumerator();
    }

    private static void DisposeItem(V item)
    {
        if (item is IDisposable disposable)
        {
            disposable.Dispose();
        }
    }

    public void Dispose()
    {
        if (!disposedValue)
        {
            foreach (var item in dictionary.Values)
            {
                DisposeItem(item);
            }
            dictionary.Clear();
            disposedValue = true;
        }
    }
}

public static class DisposingDictionaryExtensions
{
    public static DisposingDictionary<K, V> ToDisposingDictionary<K, V>(this IEnumerable<KeyValuePair<K, V>> source)
        where K : notnull
        where V : class
    {
        var dictionary = new DisposingDictionary<K, V>();
        try
        {
            foreach (var item in source)
            {
                dictionary.Add(item);
            }
            return dictionary;
        }
        catch
        {
            dictionary.Dispose();
            throw;
        }
    }
}
