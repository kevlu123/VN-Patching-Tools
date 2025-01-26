using System.Collections;

namespace Ws2Explorer;

public sealed class DisposingList<T> : IList<T>, IDisposable
    where T : class
{
    private readonly List<T> list = [];
    private bool disposedValue;

    public int Count => list.Count;

    public bool IsReadOnly => false;

    public T this[int index]
    {
        get => list[index];
        set
        {
            if (list[index] != value)
            {
                DisposeItem(list[index]);
                list[index] = value;
            }
        }
    }

    public void Add(T item)
    {
        list.Add(item);
    }

    public void AddRange(IEnumerable<T> items)
    {
        list.AddRange(items);
    }

    public void RemoveAt(int index)
    {
        DisposeItem(list[index]);
        list.RemoveAt(index);
    }

    public void Pop()
    {
        DisposeItem(list[^1]);
        list.RemoveAt(list.Count - 1);
    }

    public void Clear()
    {
        foreach (var item in list)
        {
            DisposeItem(item);
        }
        list.Clear();
    }

    public int IndexOf(T item)
    {
        return list.IndexOf(item);
    }

    public void Insert(int index, T item)
    {
        list.Insert(index, item);
    }

    public bool Contains(T item)
    {
        return list.Contains(item);
    }

    public void CopyTo(T[] array, int arrayIndex)
    {
        list.CopyTo(array, arrayIndex);
    }

    public bool Remove(T item)
    {
        if (list.Remove(item))
        {
            DisposeItem(item);
            return true;
        }
        return false;
    }

    private static void DisposeItem(T item)
    {
        if (item is IDisposable disposable)
        {
            disposable.Dispose();
        }
    }

    public IEnumerator<T> GetEnumerator()
    {
        return ((IEnumerable<T>)list).GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return ((IEnumerable)list).GetEnumerator();
    }

    public void Dispose()
    {
        if (!disposedValue)
        {
            foreach (var item in list)
            {
                DisposeItem(item);
            }
            list.Clear();
            disposedValue = true;
        }
    }
}

public static class DisposingListExtensions
{
    public static DisposingList<T> ToDisposingList<T>(this IEnumerable<T> source)
        where T : class
    {
        var list = new DisposingList<T>();
        try
        {
            // If iterating source throws inside AddRange, the elements added
            // up to that point will exist in the list and will be disposed.
            list.AddRange(source);
            return list;
        }
        catch
        {
            list.Dispose();
            throw;
        }
    }
}
