using System.Collections;
using System.Diagnostics.CodeAnalysis;

namespace Ws2Explorer;

/// <summary>
/// A dictionary that disposes its values when they are removed or replaced.
/// </summary>
/// <typeparam name="K"></typeparam>
/// <typeparam name="V"></typeparam>
public sealed class DisposingDictionary<K, V> : IDictionary<K, V>, IDisposable
    where K : notnull
    where V : class?
{
    private readonly Action<V> dispose;
    private readonly Dictionary<K, V> dictionary = [];
    private bool disposedValue;

    /// <summary>
    /// Gets or sets the value associated with the specified key.
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    public V this[K key]
    {
        get => dictionary[key];
        set
        {
            if (dictionary.TryGetValue(key, out var oldValue) && oldValue != value)
            {
                dispose(oldValue);
            }
            dictionary[key] = value;
        }
    }

    /// <summary>
    /// Gets a collection containing the keys in the dictionary.
    /// </summary>
    public ICollection<K> Keys => dictionary.Keys;

    /// <summary>
    /// Gets a collection containing the values in the dictionary.
    /// </summary>
    public ICollection<V> Values => dictionary.Values;

    /// <summary>
    /// Gets the number of key/value pairs in the dictionary.
    /// </summary>
    public int Count => dictionary.Count;

    /// <summary>
    /// Gets a value indicating whether the dictionary is read-only.
    /// </summary>
    public bool IsReadOnly => ((ICollection<KeyValuePair<K, V>>)dictionary).IsReadOnly;

    /// <summary>
    /// Initializes a new instance of the <see cref="DisposingDictionary{K, V}"/> class.
    /// </summary>
    /// <param name="dispose">
    /// The function to call when a value is removed or replaced.
    /// If not specified, the default behavior is to call <see cref="IDisposable.Dispose"/>.
    /// </param>
    public DisposingDictionary(Action<V>? dispose = null)
    {
        this.dispose = dispose ?? (item => (item as IDisposable)?.Dispose());
    }

    /// <summary>
    /// Adds the specified key and value to the dictionary.
    /// </summary>
    /// <param name="key"></param>
    /// <param name="value"></param>
    public void Add(K key, V value)
    {
        dictionary.Add(key, value);
    }

    /// <summary>
    /// Adds the specified key and value to the dictionary.
    /// </summary>
    /// <param name="item"></param>
    public void Add(KeyValuePair<K, V> item)
    {
        ((ICollection<KeyValuePair<K, V>>)dictionary).Add(item);
    }

    /// <summary>
    /// Removes all keys and values from the dictionary.
    /// </summary>
    public void Clear()
    {
        foreach (var item in dictionary.Values)
        {
            dispose(item);
        }
        dictionary.Clear();
    }

    /// <summary>
    /// Determines whether the dictionary contains the specified key/value pair.
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    public bool Contains(KeyValuePair<K, V> item)
    {
        return dictionary.Contains(item);
    }

    /// <summary>
    /// Determines whether the dictionary contains the specified key.
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    public bool ContainsKey(K key)
    {
        return dictionary.ContainsKey(key);
    }

    /// <summary>
    /// Copies the key/value pairs to an array.
    /// </summary>
    /// <param name="array"></param>
    /// <param name="arrayIndex"></param>
    public void CopyTo(KeyValuePair<K, V>[] array, int arrayIndex)
    {
        ((ICollection<KeyValuePair<K, V>>)dictionary).CopyTo(array, arrayIndex);
    }

    /// <summary>
    /// Returns an enumerator that iterates through the dictionary.
    /// </summary>
    /// <returns></returns>
    public IEnumerator<KeyValuePair<K, V>> GetEnumerator()
    {
        return dictionary.GetEnumerator();
    }

    /// <summary>
    /// Removes the value with the specified key from the dictionary.
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    public bool Remove(K key)
    {
        if (dictionary.TryGetValue(key, out var value))
        {
            dispose(value);
        }
        return dictionary.Remove(key);
    }

    /// <summary>
    /// Removes the specified key/value pair from the dictionary.
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    public bool Remove(KeyValuePair<K, V> item)
    {
        if (dictionary.TryGetValue(item.Key, out var value))
        {
            dispose(value);
        }
        return dictionary.Remove(item.Key);
    }

    /// <summary>
    /// Gets the value associated with the specified key.
    /// </summary>
    /// <param name="key"></param>
    /// <param name="value"></param>
    /// <returns></returns>
    public bool TryGetValue(K key, [MaybeNullWhen(false)] out V value)
    {
        return dictionary.TryGetValue(key, out value);
    }

    /// <summary>
    /// Returns an enumerator that iterates through the dictionary.
    /// </summary>
    /// <returns></returns>
    IEnumerator IEnumerable.GetEnumerator()
    {
        return dictionary.GetEnumerator();
    }

    /// <summary>
    /// Disposes the dictionary and all its values.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            foreach (var item in dictionary.Values)
            {
                dispose(item);
            }
            dictionary.Clear();
            disposedValue = true;
        }
    }
}

/// <summary>
/// Extension methods for <see cref="DisposingDictionary{K, V}"/>.
/// </summary>
public static class DisposingDictionaryExtensions
{
    /// <summary>
    /// Converts the specified collection of key/value pairs to a <see cref="DisposingDictionary{K, V}"/>.
    /// </summary>
    /// <typeparam name="K"></typeparam>
    /// <typeparam name="V"></typeparam>
    /// <param name="source"></param>
    /// <param name="dispose"></param>
    /// <returns></returns>
    public static DisposingDictionary<K, V> ToDisposingDictionary<K, V>(
        this IEnumerable<KeyValuePair<K, V>> source,
        Action<V>? dispose = null)
        where K : notnull
        where V : class
    {
        var dictionary = new DisposingDictionary<K, V>(dispose);
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
