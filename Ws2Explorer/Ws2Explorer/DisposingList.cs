using System.Collections;

namespace Ws2Explorer;

/// <summary>
/// A list that disposes its elements when they are removed or replaced.
/// </summary>
/// <typeparam name="T"></typeparam>
public sealed class DisposingList<T> : IList<T>, IDisposable
    where T : class
{
    private readonly Action<T> dispose;
    private readonly List<T> list = [];
    private bool disposedValue;

    /// <summary>
    /// Gets the number of elements contained in the list.
    /// </summary>
    public int Count => list.Count;

    /// <summary>
    /// Gets a value indicating whether the list is read-only.
    /// </summary>
    public bool IsReadOnly => false;

    /// <summary>
    /// Gets or sets the element at the specified index.
    /// </summary>
    /// <param name="index"></param>
    /// <returns></returns>
    public T this[int index]
    {
        get => list[index];
        set
        {
            if (list[index] != value)
            {
                dispose(list[index]);
                list[index] = value;
            }
        }
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="DisposingList{T}"/> class.
    /// </summary>
    /// <param name="dispose">
    /// The function to call when an element is removed or replaced.
    /// If not specified, the default behavior is to call <see cref="IDisposable.Dispose"/>.
    /// </param>
    public DisposingList(Action<T>? dispose = null)
    {
        this.dispose = dispose ?? (item => (item as IDisposable)?.Dispose());
    }

    /// <summary>
    /// Adds an element to the end of the list.
    /// </summary>
    /// <param name="item"></param>
    public void Add(T item)
    {
        list.Add(item);
    }

    /// <summary>
    /// Adds the elements of the specified collection to the end of the list.
    /// </summary>
    /// <param name="items"></param>
    public void AddRange(IEnumerable<T> items)
    {
        list.AddRange(items);
    }

    /// <summary>
    /// Removes the element at the specified index of the list.
    /// </summary>
    /// <param name="index"></param>
    public void RemoveAt(int index)
    {
        dispose(list[index]);
        list.RemoveAt(index);
    }

    /// <summary>
    /// Removes the last element of the list.
    /// </summary>
    public void Pop()
    {
        dispose(list[^1]);
        list.RemoveAt(list.Count - 1);
    }

    /// <summary>
    /// Removes all elements from the list.
    /// </summary>
    public void Clear()
    {
        foreach (var item in list)
        {
            dispose(item);
        }
        list.Clear();
    }

    /// <summary>
    /// Determines the index of a specific item in the list.
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    public int IndexOf(T item)
    {
        return list.IndexOf(item);
    }

    /// <summary>
    /// Inserts an element into the list at the specified index.
    /// </summary>
    /// <param name="index"></param>
    /// <param name="item"></param>
    public void Insert(int index, T item)
    {
        list.Insert(index, item);
    }

    /// <summary>
    /// Determines whether the list contains a specific value.
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    public bool Contains(T item)
    {
        return list.Contains(item);
    }

    /// <summary>
    /// Copies the elements of the list to an array.
    /// </summary>
    /// <param name="array"></param>
    /// <param name="arrayIndex"></param>
    public void CopyTo(T[] array, int arrayIndex)
    {
        list.CopyTo(array, arrayIndex);
    }

    /// <summary>
    /// Removes the first occurrence of a specific object from the list.
    /// </summary>
    /// <param name="item"></param>
    /// <returns></returns>
    public bool Remove(T item)
    {
        if (list.Remove(item))
        {
            dispose(item);
            return true;
        }
        return false;
    }

    /// <summary>
    /// Returns an enumerator that iterates through the list.
    /// </summary>
    /// <returns></returns>
    public IEnumerator<T> GetEnumerator()
    {
        return ((IEnumerable<T>)list).GetEnumerator();
    }

    /// <summary>
    /// Returns an enumerator that iterates through the list.
    /// </summary>
    /// <returns></returns>
    IEnumerator IEnumerable.GetEnumerator()
    {
        return ((IEnumerable)list).GetEnumerator();
    }

    /// <summary>
    /// Disposes all elements in the list.
    /// </summary>
    public void Dispose()
    {
        if (!disposedValue)
        {
            foreach (var item in list)
            {
                dispose(item);
            }
            list.Clear();
            disposedValue = true;
        }
    }
}

/// <summary>
/// Extension methods for <see cref="DisposingList{T}"/>.
/// </summary>
public static class DisposingListExtensions
{
    /// <summary>
    /// Creates a new <see cref="DisposingList{T}"/> from the specified collection.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="source"></param>
    /// <param name="dispose"></param>
    /// <returns></returns>
    public static DisposingList<T> ToDisposingList<T>(this IEnumerable<T> source, Action<T>? dispose = null)
        where T : class
    {
        var list = new DisposingList<T>(dispose);
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
