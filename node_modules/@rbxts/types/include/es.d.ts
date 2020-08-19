/// <reference no-default-lib="true"/>

/** unknown - undefined = defined */
type defined = {};

/**
 * **DO NOT USE!** This type only exists because TypeScript requires it!
 *
 * **Use `boolean` instead!**
 */
interface Boolean {}
/** **DO NOT USE!** This type only exists because TypeScript requires it! */
interface IArguments {}
/**
 * **DO NOT USE!** This type only exists because TypeScript requires it!
 *
 * **Use `number` instead!**
 */
interface Number {}
interface Object {}
/** **DO NOT USE!** This type only exists because TypeScript requires it! */
interface RegExp {}
/**
 * **DO NOT USE!** This type only exists because TypeScript requires it!
 *
 * **Use the arrow function form instead!**
 *
 * For example,`(a: string, b: number) => boolean` represents a function that takes a `string` and a `number` and
 * returns a `boolean`.
 *
 * More generally, `(a: A, b: B, c: C) => R`, where `A`, `B`, and `C` are different function argument types and `R` is
 * the return type.
 *
 * You can use `void` as a return type for functions that do not return anything: `() => void`
 */
interface Function {
	prototype: never;
}
/** **DO NOT USE!** This type only exists because TypeScript requires it! */
interface CallableFunction extends Function {}
/** **DO NOT USE!** This type only exists because TypeScript requires it! */
interface NewableFunction extends Function {}

/** Marker for contextual 'this' type */
interface ThisType<T> {}

/** @rbxts array */
interface ArrayLike<T> {
	/**
	 * Gets the length of the array. This is one higher than the highest index defined in an array.
	 */
	size(): number;
	readonly [n: number]: T;
}

interface ObjectConstructor {
	/**
	 * Copy the values of all of the enumerable own properties from one or more source objects to a target object.
	 * Returns the target object.
	 */
	assign<A, B>(this: ObjectConstructor, target: A, source: B): A & B;
	assign<A, B, C>(this: ObjectConstructor, target: A, source1: B, source2: C): A & B & C;
	assign<A, B, C, D>(this: ObjectConstructor, target: A, source1: B, source2: C, source3: D): A & B & C & D;
	assign<A, B, C, D, E>(
		this: ObjectConstructor,
		target: A,
		source1: B,
		source2: C,
		source3: D,
		source4: E,
	): A & B & C & D & E;
	assign<A, B, C, D, E, F>(
		this: ObjectConstructor,
		target: A,
		source1: B,
		source2: C,
		source3: D,
		source4: E,
		source5: F,
	): A & B & C & D & E & F;
	assign(this: ObjectConstructor, target: object, ...sources: Array<any>): any;

	/**
	 * Returns the names of the enumerable properties and methods of an object.
	 * @param o Object that contains the properties and methods. This can be an object that you created or an existing Document Object Model (DOM) object.
	 */
	keys<T extends object>(
		this: ObjectConstructor,
		o: T,
	): T extends Array<any>
		? Array<number>
		: T extends ReadonlySet<infer U>
		? Array<U>
		: T extends ReadonlyMap<infer K, any>
		? Array<K>
		: T extends ArrayLike<any>
		? Array<number>
		: keyof T extends never
		? Array<unknown>
		: Array<keyof T>;

	/**
	 * Returns an array of values of the enumerable properties of an object
	 * @param o Object that contains the properties and methods. This can be an object that you created or an existing Document Object Model (DOM) object.
	 */
	values<T extends object>(
		this: ObjectConstructor,
		o: T,
	): T extends Array<infer U>
		? Array<NonNullable<U>>
		: T extends ReadonlySet<any>
		? Array<true>
		: T extends ReadonlyMap<any, infer V>
		? Array<NonNullable<V>>
		: T extends ArrayLike<infer W>
		? Array<NonNullable<W>>
		: keyof T extends never
		? Array<unknown>
		: Array<NonNullable<T[keyof T]>>;

	/**
	 * Returns an array of key/values of the enumerable properties of an object
	 * @param o Object that contains the properties and methods. This can be an object that you created or an existing Document Object Model (DOM) object.
	 */
	entries<T extends object>(
		this: ObjectConstructor,
		o: T,
	): T extends Array<infer U>
		? Array<[number, NonNullable<U>]>
		: T extends ReadonlySet<infer E>
		? Array<[E, true]>
		: T extends ReadonlyMap<infer K, infer V>
		? Array<[K, NonNullable<V>]>
		: T extends ArrayLike<infer W>
		? Array<[number, NonNullable<W>]>
		: keyof T extends never
		? Array<[unknown, unknown]>
		: Array<[keyof T, NonNullable<T[keyof T]>]>;

	/** Creates an object from a set of entries */
	fromEntries<P extends readonly [string | number | symbol, unknown]>(
		this: ObjectConstructor,
		i: ReadonlyArray<P>,
	): Reconstruct<
		UnionToIntersection<
			P extends unknown
				? {
						[k in P[0]]: P[1];
				  }
				: never
		>
	>;

	/**
	 * Returns true if empty, otherwise false.
	 */
	isEmpty(this: ObjectConstructor, o: object): boolean;

	/**
	 * Returns a shallow copy of the object
	 */
	copy<T extends object>(this: ObjectConstructor, o: T): T;

	/**
	 * Returns a deep copy of the object
	 */
	deepCopy<T extends object>(this: ObjectConstructor, o: T): T;

	/**
	 * Returns true if
	 * - each member of `a` equals each member of `b`
	 * - `b` has no members that do not exist in `a`.
	 *
	 * Searches recursively.
	 */
	deepEquals(this: ObjectConstructor, a: object, b: object): boolean;
}

/**
 * Provides functionality common to all JavaScript objects.
 */
declare const Object: ObjectConstructor;

/** @rbxts string */
interface String extends Iterable<string> {
	/** The current number of characters in the string. */
	size(this: string): number;

	/** Returns a new string equivalent to this string but with the whitespace removed from the start and end. */
	trim(this: string): string;

	/** Returns a new string equivalent to this string but with the whitespace removed from the start. */
	trimStart(this: string): string;

	/** Returns a new string equivalent to this string but with the whitespace removed from the end. */
	trimEnd(this: string): string;

	/**
	 * Pads the current string with a given string (possibly repeated) so that the resulting string reaches a given length.
	 * The padding is applied from the start (left) of the current string.
	 *
	 * @param maxLength The length of the resulting string once the current string has been padded.
	 *        If this parameter is smaller than the current string's length, the current string will be returned as it is.
	 *
	 * @param fillString The string to pad the current string with.
	 *        If this string is too long, it will be truncated and the left-most part will be applied.
	 *        The default value for this parameter is " " (U+0020).
	 */
	padStart(this: string, maxLength: number, fillString?: string): string;

	/**
	 * Pads the current string with a given string (possibly repeated) so that the resulting string reaches a given length.
	 * The padding is applied from the end (right) of the current string.
	 *
	 * @param maxLength The length of the resulting string once the current string has been padded.
	 *        If this parameter is smaller than the current string's length, the current string will be returned as it is.
	 *
	 * @param fillString The string to pad the current string with.
	 *        If this string is too long, it will be truncated and the left-most part will be applied.
	 *        The default value for this parameter is " " (U+0020).
	 */
	padEnd(this: string, maxLength: number, fillString?: string): string;

	/**
	 * Returns a section of a string.
	 * @param start The index to the beginning of the specified portion of stringObj.
	 * @param end The index to the end of the specified portion of stringObj. The substring includes the characters up to, but not including, the character indicated by end.
	 * If this value is not specified, the substring continues to the end of stringObj.
	 */
	slice(this: string, start: number, end?: number): string;

	/**
	 * Returns the index of the first occurrence of a value in a string, else returns -1.
	 * @param searchElement The value to locate in the string.
	 * @param fromIndex The string index at which to begin the search. If fromIndex is omitted, the search starts at index 0.
	 */
	indexOf(this: string, searchElement: string, fromIndex?: number): number;

	/**
	 * Returns whether a string includes a certain string.
	 * @param searchElement The element to search for.
	 * @param fromIndex The position in this string at which to begin searching for searchElement.
	 */
	includes(this: string, searchElement: string, fromIndex?: number): boolean;

	/**
	 * Returns whether the characters at the end of this string match the searchString, starting at position.
	 * @param searchString The element to search for.
	 * @param position The position in this string at which to begin searching for searchElement.
	 */
	endsWith(this: string, searchString: string, endPosition?: number): boolean;

	/**
	 * Returns whether the characters at the beginning of this string match the searchString, starting at position.
	 * @param searchString The element to search for.
	 * @param position The position in this string at which to begin searching for searchElement.
	 */
	startsWith(this: string, searchString: string, position?: number): boolean;
}

interface Symbol {
	/**
	 * Returns a string representation of this data structure.
	 */
	toString(this: Symbol): string;
}

interface SymbolConstructor {
	/**
	 * A method that returns the default iterator for an object. Called by the semantics of the
	 * for-of statement.
	 */
	readonly iterator: symbol;
	readonly asyncIterator: symbol;

	/**
	 * Returns a new unique Symbol value.
	 * @param  description Description of the new Symbol object.
	 */
	(description?: string | number): symbol;

	/**
	 * Returns a Symbol object from the global symbol registry matching the given key if found.
	 * Otherwise, returns a new symbol with this key.
	 * @param key key to search for.
	 */
	for(this: SymbolConstructor, key: string): symbol;

	/**
	 * Returns a key from the global symbol registry matching the given Symbol if found.
	 * Otherwise, returns a undefined.
	 * @param sym Symbol to find the key for.
	 */
	keyFor(this: SymbolConstructor, sym: symbol): string | undefined;
}
declare var Symbol: SymbolConstructor;

type IteratorResult<Yields, Returns = void> = IteratorYieldResult<Yields> | IteratorReturnResult<Returns>;

interface IteratorYieldResult<Yields> {
	done: false;
	value: Yields;
}

interface IteratorReturnResult<Returns> {
	done: true;
	value: Returns;
}

interface Iterator<Yields, Returns = void, Next = undefined> {
	// Takes either 0 or 1 arguments - doesn't accept 'undefined'
	next: (...args: [] | [Next]) => IteratorResult<Yields, Returns>;
}

interface AsyncIterator<Yields, Returns = any, Next = undefined> {
	next: (...args: [] | [Next]) => Promise<IteratorResult<Yields, Returns>>;
}

interface Generator<Yields = unknown, Returns = void, Next = unknown> extends Iterator<Yields, Returns, Next> {
	next: (...args: [] | [Next]) => IteratorResult<Yields, Returns>;
	[Symbol.iterator](): Generator<Yields, Returns, Next>;
}

interface AsyncGenerator<Yields = unknown, Returns = any, Next = unknown> extends AsyncIterator<Yields, Returns, Next> {
	next: (...args: [] | [Next]) => Promise<IteratorResult<Yields, Returns>>;
	[Symbol.asyncIterator](): AsyncGenerator<Yields, Returns, Next>;
}

interface AsyncIterable<T> {
	[Symbol.asyncIterator](): AsyncIterator<T>;
}

interface Iterable<T> {
	[Symbol.iterator](): Iterator<T>;
}

interface AsyncIterableIterator<T> extends AsyncIterator<T> {
	[Symbol.asyncIterator](): AsyncIterableIterator<T>;
}

interface IterableIterator<T> extends Iterator<T> {
	[Symbol.iterator](): IterableIterator<T>;
}

interface FirstDecrementedIterableFunction extends Iterable<LuaTuple<[number, number]>> {
	(): LuaTuple<[number, number]>;
}

interface DoubleDecrementedIterableFunction extends Iterable<LuaTuple<[number, number]>> {
	(): LuaTuple<[number, number]>;
}

interface IterableFunction<T> extends Iterable<T> {
	(): T;
}

/**
 * An array object which cannot be written to.
 * @rbxts array
 */
interface ReadonlyArray<T> extends ArrayLike<T>, Iterable<T> {
	/**
	 * Returns true if empty, otherwise false.
	 */
	isEmpty(this: ReadonlyArray<any>): boolean;

	/**
	 * Returns a string representation of this data structure. Meant for debugging only.
	 */
	toString(this: ReadonlyArray<any>): string;

	/**
	 * Creates a new array and shallow copies `this` and the items into the new array, in that order.
	 * @param items Additional items to add to the end of array1.
	 */
	concat(this: ReadonlyArray<defined>, ...items: Array<ReadonlyArray<T>>): Array<T>;

	/**
	 * Adds all the elements of an array separated by the specified separator string.
	 * @param separator A string used to separate one element of an array from the next in the resulting String. If omitted, the array elements are separated with a comma.
	 */
	join(this: ReadonlyArray<defined>, separator?: string): string;

	/**
	 * Shallow copies a section of this array selected from `begin` to `end` (`end` not included) where `begin` and `end` represent the index of items in that array.
	 * @param start The beginning of the specified portion of the array.
	 * @param end The end of the specified portion of the array.
	 */
	slice(this: ReadonlyArray<defined>, start?: number, end?: number): Array<T>;

	/**
	 * Returns whether an array includes a certain element.
	 * @param searchElement The element to search for.
	 * @param fromIndex The position in this array at which to begin searching for searchElement.
	 */
	includes(this: ReadonlyArray<defined>, searchElement: T, fromIndex?: number): boolean;

	/**
	 * Returns the index of the first occurrence of a value in an array, else returns -1.
	 * @param searchElement The value to locate in the array.
	 * @param fromIndex The array index at which to begin the search. If fromIndex is omitted, the search starts at index 0.
	 */
	indexOf(this: ReadonlyArray<defined>, searchElement: T, fromIndex?: number): number;

	/**
	 * Returns the index of the last occurrence of a specified value in an array.
	 * @param searchElement The value to locate in the array.
	 * @param fromIndex The array index at which to begin the search. If fromIndex is omitted, the search starts at the last index in the array.
	 */
	lastIndexOf(this: ReadonlyArray<defined>, searchElement: T, fromIndex?: number): number;

	/**
	 * Returns whether **all** the members of an array satisfy the specified test.
	 * Returns true for empty Arrays.
	 * @param callbackfn A function that accepts up to three arguments. The every method calls the callbackfn function for each element in array1 until the callbackfn returns false, or until the end of the array.
	 */
	every(
		this: ReadonlyArray<defined>,
		callbackfn: (value: T, index: number, array: ReadonlyArray<T>) => boolean | undefined,
	): boolean;

	/**
	 * Returns whether the specified callback function returns true for any element of an array.
	 * Returns false for empty Arrays.
	 * @param callbackfn A function that accepts up to three arguments. The some method calls the callbackfn function for each element in array1 until the callbackfn returns true, or until the end of the array.
	 */
	some(
		this: ReadonlyArray<defined>,
		callbackfn: (value: T, index: number, array: ReadonlyArray<T>) => boolean | undefined,
	): boolean;

	/**
	 * Performs the specified action for each element in an array.
	 * @param callbackfn  A function that accepts up to three arguments. forEach calls the callbackfn function one time for each element in the array.
	 */
	forEach(this: ReadonlyArray<defined>, callbackfn: (value: T, index: number, array: ReadonlyArray<T>) => void): void;

	/**
	 * Calls a defined callback function on each element of an array, and returns an array that contains the results.
	 * @param callbackfn A function that accepts up to three arguments. The map method calls the callbackfn function one time for each element in the array.
	 */
	map<U extends defined>(
		this: ReadonlyArray<defined>,
		callbackfn: (value: T, index: number, array: ReadonlyArray<T>) => U,
	): Array<U>;

	/**
	 * Calls a defined callback function on each element of an array, and returns an array that contains the results. Undefined values will not be included, so keep in mind this does not create a 1:1 map.
	 * @param callbackfn A function that accepts up to three arguments. The map method calls the callbackfn function one time for each element in the array.
	 * @example
	 * // Gets an Array of all existing characters
	 * const characters = playerlist.mapFiltered(plr => plr.Character);
	 */
	mapFiltered<U>(
		this: ReadonlyArray<defined>,
		callbackfn: (value: T, index: number, array: ReadonlyArray<T>) => U,
	): Array<NonNullable<U>>;

	/**
	 * Removes all undefined values from the array safely
	 */
	filterUndefined(this: undefined extends T ? ReadonlyArray<T> : never): Array<NonNullable<T>>;

	/**
	 * Returns the elements of an array that meet the condition specified in a callback function.
	 * @param callbackfn A function that accepts up to three arguments. The filter method calls the callbackfn function one time for each element in the array.
	 */
	filter<S extends T>(
		this: ReadonlyArray<defined>,
		callbackfn: (value: T, index: number, array: ReadonlyArray<T>) => value is S,
	): Array<S>;

	/**
	 * Returns the elements of an array that meet the condition specified in a callback function.
	 * @param callbackfn A function that accepts up to three arguments. The filter method calls the callbackfn function one time for each element in the array.
	 */
	filter(
		this: ReadonlyArray<defined>,
		callbackfn: (value: T, index: number, array: ReadonlyArray<T>) => boolean | undefined,
	): Array<T>;

	/**
	 * Calls the specified callback function for all the elements in an array. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.
	 * @param callbackfn A function that accepts up to four arguments. The reduce method calls the callbackfn function one time for each element in the array.
	 * @param initialValue If initialValue is specified, it is used as the initial value to start the accumulation. The first call to the callbackfn function provides this value as an argument instead of an array value.
	 */
	reduce(
		this: ReadonlyArray<defined>,
		callbackfn: (accumulator: T, currentValue: T, currentIndex: number, array: ReadonlyArray<T>) => T,
	): T;

	/**
	 * Calls the specified callback function for all the elements in an array. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.
	 * @param callbackfn A function that accepts up to four arguments. The reduce method calls the callbackfn function one time for each element in the array.
	 * @param initialValue If initialValue is specified, it is used as the initial value to start the accumulation. The first call to the callbackfn function provides this value as an argument instead of an array value.
	 */
	reduce<U>(
		this: ReadonlyArray<defined>,
		callbackfn: (accumulator: U, currentValue: T, currentIndex: number, array: ReadonlyArray<T>) => U,
		initialValue: U,
	): U;

	/**
	 * Calls the specified callback function for all the elements in an array, in descending order. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.
	 * @param callbackfn A function that accepts up to four arguments. The reduceRight method calls the callbackfn function one time for each element in the array.
	 * @param initialValue If initialValue is specified, it is used as the initial value to start the accumulation. The first call to the callbackfn function provides this value as an argument instead of an array value.
	 */
	reduceRight(
		this: ReadonlyArray<defined>,
		callbackfn: (accumulator: T, currentValue: T, currentIndex: number, array: ReadonlyArray<T>) => T,
	): T;

	/**
	 * Calls the specified callback function for all the elements in an array, in descending order. The return value of the callback function is the accumulated result, and is provided as an argument in the next call to the callback function.
	 * @param callbackfn A function that accepts up to four arguments. The reduceRight method calls the callbackfn function one time for each element in the array.
	 * @param initialValue If initialValue is specified, it is used as the initial value to start the accumulation. The first call to the callbackfn function provides this value as an argument instead of an array value.
	 */
	reduceRight<U>(
		this: ReadonlyArray<defined>,
		callbackfn: (accumulator: U, currentValue: T, currentIndex: number, array: ReadonlyArray<T>) => U,
		initialValue: U,
	): U;

	/**
	 * Returns a copy of the array with elements in reverse order. The compiler will automatically optimize this away when used in-line in a for..of loop.
	 */
	reverse(this: ReadonlyArray<defined>): Array<T>;

	/**
	 * Returns an array of every index-value pair in this array. The compiler will automatically optimize this away when used in-line in a for..of loop.
	 */
	entries(this: ReadonlyArray<defined>): Array<[number, T]>;

	/**
	 * Returns the value of the first element in the array where predicate is true, and undefined
	 * otherwise.
	 * @param predicate find calls predicate once for each element of the array, in ascending
	 * order, until it finds one where predicate returns true. If such an element is found, find
	 * immediately returns that element value. Otherwise, find returns undefined.
	 */
	find<S extends T>(
		this: ReadonlyArray<defined>,
		predicate: (value: T, index: number, obj: ReadonlyArray<T>) => value is S,
	): S | undefined;
	find(
		this: ReadonlyArray<defined>,
		predicate: (value: T, index: number, obj: ReadonlyArray<T>) => boolean | undefined,
	): T | undefined;

	/**
	 * Returns the index of the first element in the array that satisfies the provided testing function. Otherwise, it returns -1, indicating no element passed the test.
	 * @param predicate findIndex calls predicate once for each element of the array, in ascending
	 * order, until it finds one where predicate returns true. If such an element is found, find
	 * immediately returns the index at which it was found. Otherwise, find returns -1.
	 */
	findIndex(
		this: ReadonlyArray<defined>,
		predicate: (value: T, index: number, obj: ReadonlyArray<T>) => boolean | undefined,
	): number;

	/**
	 * Returns a shallow copy of the array
	 */
	copy(this: ReadonlyArray<defined>): Array<T>;

	/**
	 * Returns a deep copy of the array
	 */
	deepCopy(this: ReadonlyArray<defined>): Array<T>;

	/**
	 * Returns true if
	 * - each member of `a` equals each member of `b`
	 * - `b` has no members that do not exist in `a`.
	 *
	 * Searches recursively.
	 */
	deepEquals(this: ReadonlyArray<defined>, other: ReadonlyArray<defined>): boolean;

	/**
	 * The flat() method creates a new array with all sub-array elements concatenated into it recursively up to the specified depth.
	 * @param depth The depth level specifying how deep a nested array structure should be flattened. Defaults to 1.
	 * @returns A new array with the sub-array elements concatenated into it.
	 */
	// flat(this: ReadonlyArray<T>, depth?: number): Array<T>;
}

/**
 * An Array object
 * @rbxts array
 */
interface Array<T> extends ReadonlyArray<T> {
	/**
	 * Appends new elements to an array and returns the new length of the array.
	 * @param items New elements of the Array.
	 */
	push(this: Array<defined>, ...items: Array<T>): number;

	/**
	 * Removes the last element from an array and returns it.
	 */
	pop(this: Array<defined>): T | undefined;

	/**
	 * Removes the first element from an array and returns it.
	 */
	shift(this: Array<defined>): T | undefined;

	/**
	 * Removes elements from an array and, if necessary, inserts new elements in their place, returning the deleted elements.
	 * @param start The zero-based location in the array from which to start removing elements.
	 * @param deleteCount The number of elements to remove.
	 */
	splice(this: Array<defined>, start: number, deleteCount?: number): Array<T>;

	/**
	 * Removes elements from an array and, if necessary, inserts new elements in their place, returning the deleted elements.
	 * @param start The zero-based location in the array from which to start removing elements.
	 * @param deleteCount The number of elements to remove.
	 * @param items Elements to insert into the array in place of the deleted elements.
	 */
	splice(this: Array<defined>, start: number, deleteCount: number, ...items: Array<T>): Array<T>;

	/**
	 * Inserts new elements at the start of an array and returns the new length of the array.
	 * @param items  Elements to insert at the start of the Array.
	 */
	unshift(this: Array<defined>, ...items: Array<T>): number;

	/**
	 * Shallow copies part of an array to another location in the same array and returns it, without modifying its size.
	 * @param target Zero based index at which to copy the sequence to. If negative, target will be counted from the end. If target is at or greater than arr.length, nothing will be copied. If target is positioned after start, the copied sequence will be trimmed to fit arr.length.
	 * @param start Zero based index at which to start copying elements from. If negative, start will be counted from the end. If start is omitted, copyWithin will copy from the start (defaults to 0).
	 * @param end Zero based index at which to end copying elements from. copyWithin copies up to but not including end. If negative, end will be counted from the end. If end is omitted, copyWithin will copy until the end (default to arr.length).
	 */
	copyWithin(this: Array<defined>, target: number, start?: number, end?: number): this;

	/**
	 * Inserts `value` into the array at `index` and shifts array members forwards if needed.
	 */
	insert(this: Array<defined>, index: number, value: T): void;

	/**
	 * Removes the array member at `index` and returns it and shifts array members backwards if needed.
	 */
	remove(this: Array<defined>, index: number): T | undefined;

	/**
	 * Removes a value at `index` from this array, replacing it with the last value in this array and popping the last value.
	 * Returns the value removed from `index` in this way if it exists, otherwise `undefined`.
	 * @param index The index to remove from this array and return
	 */
	unorderedRemove(this: Array<defined>, index: number): T | undefined;

	/**
	 * Sorts list elements in a given order, in-place, from `list[1]` to `list[#list]`, so that (`!comp(list[i+1], list[i])` will be true after the sort). Alias to Lua's `table.sort`.
	 * @param compareFunction A function that defines the sort order. Returns true when the first element must come before the second. If omitted, the array is sorted according to the `<` operator.
	 */
	sort(this: ReadonlyArray<defined>, compareFunction?: (a: T, b: T) => boolean): Array<T>;

	[n: number]: T;
}

interface ArrayConstructor {
	/** Instantiates a new empty array.
	 */
	new <T>(): Array<T>;

	/** Instantiates a new preallocated array.
	 * If length is provided, there will be allocated `length` amount of nil's into the new array.
	 * If value is provided, instead of nil, the value will be allocated instead.
	 * Note that this does not affect the `length` property of the array if no `value` is provided.
	 * it only keeps it from needing to resize to this `length` later.
	 *
	 * This is the same as `table.create` in Lua.
	 *
	 * @param length The length of the array to allocate
	 * @param value The value that the array will be filled with (amount based on `length`) (defaults to `nil`)
	 */
	new <T>(length: number, value?: T): Array<T>;
}

declare const Array: ArrayConstructor;

/** @rbxts array */
interface TemplateStringsArray extends Array<string> {}

/**
 * A Map object which cannot be written to. The Map object holds key-value pairs but doesn't remember the original insertion order of the keys (like JS would). Any value (both objects and primitive values) may be used as either a key or a value.
 * Maps are the best choice for dynamic indexing/newindexing, whereas Objects are better for explicit indexing.
 * @rbxts map
 * @example
 * // ReadonlyMaps are particularly useful for defining readonly-associations with non-numeric, non-string keys.
 * new ReadonlyMap<Enum.HumanoidRigType, () => void>([
 * 	[Enum.HumanoidRigType.R6, () => {}],
 * 	[Enum.HumanoidRigType.R15, () => {}],
 * ]);
 * // Do not use Maps when you can easily index from an object:
 *
 * // TS doesn't assume "x" | "y" are the only possible fields.
 * // You could manually type this as ReadonlyMap<"x" | "y", number>
 * const point = new ReadonlyMap([["x", 5], ["y", 10]]);
 * // this is typed as possibly undefined, which isn't ideal
 * print(point.get("x"));
 *
 * // Instead use an object
 * const point = { x: 5, y: 10 } as const;
 * print(point.x);
 */
interface ReadonlyMap<K, V> extends Iterable<[K, V]> {
	/**
	 * Returns true if empty, otherwise false.
	 */
	isEmpty(this: ReadonlyMap<K, V>): boolean;

	/**
	 * Returns a string representation of this data structure.
	 */
	toString(this: ReadonlyMap<K, V>): string;

	/**
	 * Performs the specified action for each (element / pair of elements) in the Map
	 * @param callbackfn  A function that accepts up to three arguments. forEach calls the callbackfn function one time for each (element / pair of elements) in the array.
	 */
	forEach(this: ReadonlyMap<K, V>, callbackfn: (value: V, key: K, self: this) => void): void;

	/**
	 * Returns the number of elements in the Map
	 */
	size(this: ReadonlyMap<K, V>): number;

	/**
	 * Returns an array with all values of this Map
	 */
	values(this: ReadonlyMap<K, V>): Array<V>;

	/**
	 * Returns a boolean for whether the given key exists in the Map
	 */
	has(this: ReadonlyMap<K, V>, key: K): boolean;

	/**
	 * Returns the value associated with the given key
	 */
	get(this: ReadonlyMap<K, V>, key: K): V | undefined;

	/**
	 * Returns an array of tuples for all members of this Map
	 */
	entries(this: ReadonlyMap<K, V>): Array<[K, V]>;

	/**
	 * Returns an array with all of this map's keys
	 */
	keys(this: ReadonlyMap<K, V>): Array<K>;
}

interface ReadonlyMapConstructor {
	new <K, V>(entries?: ReadonlyArray<readonly [K, V]>): ReadonlyMap<K, V>;
}
declare var ReadonlyMap: ReadonlyMapConstructor;

/**
 * The Map object holds key-value pairs but doesn't remember the original insertion order of the keys (like JS would). Any value (both objects and primitive values) may be used as either a key or a value.
 * Maps are the best choice for dynamic indexing/newindexing, whereas Objects are better for explicit indexing.
 * @rbxts map
 * @example
 * const playerData = new Map<Player, PlayerData>();
 *
 * function f(plr: Player) {
 * 	const data = playerData.get(plr); // `data` could be undefined
 * 	if (data) { // check to make sure `data` is defined
 * 		print(`${plr.Name} has ${data.NumItems} item${data.NumItems === 1 ? "" : "s"}`);
 * 	}
 * }
 * // Do not use Maps when you can easily explicitly index from an object:
 *
 * // TS doesn't assume "x" | "y" are the only possible fields.
 * // You could manually type this as Map<"x" | "y", number>
 * const point = new Map([["x", 5], ["y", 10]]);
 * // this is typed as possibly undefined, because "x" can be deleted
 * print(point.get("x"));
 *
 * // Instead use an object
 * const point = { x: 5, y: 10 };
 * print(point.y++);
 * point.z = 15 // error!
 */
interface Map<K, V> extends ReadonlyMap<K, V> {
	/**
	 * Associates a key with a value which can be accessed later by `Map.get`
	 */
	set(this: Map<K, V>, key: K, value: V): this;

	/**
	 * Deletes the given key from the Map.
	 *
	 * Returns a boolean indicating whether or not a value was removed.
	 */
	delete(this: Map<K, V>, key: K): boolean;

	/**
	 * Deletes all members of the Map
	 */
	clear(this: Map<K, V>): void;
}

interface MapConstructor {
	new <K, V>(entries?: ReadonlyArray<readonly [K, V]>): Map<K, V>;
}
declare var Map: MapConstructor;

/**
 * A Map object with its `__mode` metamethod set to "k"
 * @rbxts map
 */
interface WeakMap<K extends object, V> extends Map<K, V> {}

interface WeakMapConstructor {
	new <K extends object, V>(entries?: ReadonlyArray<readonly [K, V]>): WeakMap<K, V>;
}
declare var WeakMap: WeakMapConstructor;

/** @rbxts set */
interface ReadonlySet<T> extends Iterable<T> {
	/**
	 * Returns true if empty, otherwise false.
	 */
	isEmpty(this: ReadonlySet<T>): boolean;

	/**
	 * Returns a string representation of this data structure.
	 */
	toString(this: ReadonlySet<T>): string;

	/**
	 * Performs the specified action for each (element / pair of elements) in the set
	 * @param callbackfn  A function that accepts up to three arguments. forEach calls the callbackfn function one time for each (element / pair of elements) in the array.
	 */
	forEach(this: ReadonlySet<T>, callbackfn: (value: T, value2: T, self: ReadonlySet<T>) => void): void;

	/**
	 * Returns the number of elements in the set
	 */
	size(this: ReadonlySet<T>): number;

	/**
	 * Returns an array with all values of this set
	 */
	values(this: ReadonlySet<T>): Array<T>;

	/**
	 * Returns a boolean for whether the given key exists in the set
	 */
	has(this: ReadonlySet<T>, value: T): boolean;

	/**
	 * Returns a new set with every element that occurs at least once in either `this` or a given set
	 */
	union<U>(this: ReadonlySet<T>, set: ReadonlySet<U>): Set<T | U>;

	/**
	 * Returns a new set with every element that occurs in both `this` and a given set
	 */
	intersect<U>(this: ReadonlySet<T>, set: ReadonlySet<U>): Set<T | U>;

	/**
	 * Returns a new set which is the result of subtracting a given set from `this`
	 */
	difference<U>(this: ReadonlySet<T>, set: ReadonlySet<U>): Set<T | U>;

	/**
	 * Returns true if `this` and a given set have no elements in common, else false.
	 */
	isDisjointWith(this: ReadonlySet<T>, set: ReadonlySet<T>): boolean;

	/**
	 * Returns a boolean for whether `this` is a subset of a given set.
	 *
	 * Note: Every set is a subset of itself, so this will return true for identical sets.
	 * A "proper subset" relationship can be checked via:
	 * ```ts
set1.isSubsetOf(set2) && !set2.isSubsetOf(set1)
```
	 */
	isSubsetOf(this: ReadonlySet<T>, set: ReadonlySet<T>): boolean;
}

interface ReadonlySetConstructor {
	new <T>(values?: ReadonlyArray<T>): ReadonlySet<T>;
}
declare const ReadonlySet: ReadonlySetConstructor;

/** @rbxts set */
interface Set<T> extends ReadonlySet<T> {
	/**
	 * Adds a value to the set
	 */
	add(this: Set<T>, value: T): this;

	/**
	 * Deletes the given key from the set.
	 *
	 * Returns a boolean indicating whether or not a value was removed.
	 */
	delete(this: Set<T>, value: T): boolean;

	/**
	 * Deletes all members of the set.
	 */
	clear(this: Set<T>): void;
}

interface SetConstructor {
	new <T>(values?: ReadonlyArray<T>): Set<T>;
}
declare const Set: SetConstructor;

/**
 * A Set object with its `__mode` metamethod set to "k"
 * @rbxts set
 */
interface WeakSet<T extends object> extends Set<T> {}

interface WeakSetConstructor {
	new <T extends object>(values?: ReadonlyArray<T>): WeakSet<T>;
}
declare const WeakSet: WeakSetConstructor;

type PromiseResolveArguments<T> = T extends void ? [] : T extends LuaTuple<infer U> ? U : [T];

interface PromiseLike<T> {
	/**
	 * Attaches callbacks for the resolution and/or rejection of the Promise.
	 * @param onResolved The callback to execute when the Promise is resolved.
	 * @param onRejected The callback to execute when the Promise is rejected.
	 * @returns A Promise for the completion of which ever callback is executed.
	 */
	then<TResult1 = T, TResult2 = never>(
		this: PromiseLike<T>,
		onResolved?: ((...values: PromiseResolveArguments<T>) => TResult1 | PromiseLike<TResult1>) | void,
		onRejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | void,
	): PromiseLike<TResult1 | TResult2>;
}

/**
 * Represents the completion of an asynchronous operation
 */
interface Promise<T> {
	/**
	 * Attaches callbacks for the resolution and/or rejection of the Promise.
	 * @param onResolved The callback to execute when the Promise is resolved.
	 * @param onRejected The callback to execute when the Promise is rejected.
	 * @returns A Promise for the completion of which ever callback is executed.
	 */
	then<TResult1 = T, TResult2 = never>(
		this: Promise<T>,
		onResolved?: ((...values: PromiseResolveArguments<T>) => TResult1 | PromiseLike<TResult1>) | void,
		onRejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | void,
	): Promise<TResult1 | TResult2>;

	/**
	 * Attaches a callback for only the rejection of the Promise.
	 * @param onRejected The callback to execute when the Promise is rejected.
	 * @returns A Promise for the completion of the callback.
	 */
	catch<TResult = never>(
		this: Promise<T>,
		onRejected?: ((reason: any) => TResult | PromiseLike<TResult>) | void,
	): Promise<T | TResult>;

	/**
	 * Attaches a callback to always run when this Promise settles, regardless of its fate.
	 * The callback runs when the Promise is resolved, rejected, or cancelled.
	 * @param onSettled The callback to execute when the Promise settles or is cancelled.
	 * @returns A Promise for the completion of the callback.
	 */
	finally<TResult = never>(
		this: Promise<T>,
		onSettled?: (() => TResult | PromiseLike<TResult>) | void,
	): Promise<T | TResult>;

	/**
	 * Cancels this promise, preventing this Promise from ever resolving or rejecting.
	 * Does not do anything if the promise is already settled.
	 * Calls the Promise's cancellation hook if it is set.
	 */
	cancel(this: Promise<T>): void;

	/**
	 * Awaits the promise synchronously utilizing the Roblox thread scheduler.
	 * Functionally equivalent to `await promise`, but can be used in cases where the function cannot be async,
	 * such as in `MarketplaceService.ProcessReceipt`.
	 * @returns A tuple with the success of the promise along with the result it provided.
	 */
	await<TResult = unknown>(this: Promise<T>): LuaTuple<[true, T] | [false, TResult]>;

	/**
	 * Returns true if this Promise has been rejected.
	 */
	isRejected(this: Promise<T>): boolean;

	/**
	 * Returns true if this Promise has been resolved.
	 */
	isResolved(this: Promise<T>): boolean;

	/**
	 * Returns true if this Promise is still pending.
	 */
	isPending(this: Promise<T>): boolean;

	/**
	 * Returns true if this Promise has been cancelled.
	 */
	isCancelled(this: Promise<T>): boolean;
}

interface PromiseConstructor {
	/**
	 * Creates an immediately rejected Promise with the given value.
	 * @param value The value to reject with.
	 */
	reject: <T = undefined>(value?: T) => Promise<T>;

	/**
	 * Creates an immediately resolved Promise with the given value.
	 * @param value The value to resolve with.
	 */
	resolve: <T = undefined>(value?: T) => Promise<T>;

	/**
	 * Accepts an array of Promises and returns a new Promise that is resolved when all input Promises resolve,
	 * or rejects if any of the input Promises reject.
	 * @param promises An array of Promises.
	 */
	all: <T>(promises: Array<Promise<T>>) => Promise<Array<T>>;

	/**
	 * Spawns a function on a new thread, but begins running it immediately
	 * instead of being deferred. This is sometimes known as a "fast spawn".
	 * Should be preferred over `spawn` in Promises for more predictable timing.
	 * @param callback The function to call. Any further arguments are passed as parameters.
	 */
	spawn: <T extends Array<any>>(callback: (...args: T) => void, ...args: T) => void;

	/**
	 * Returns a boolean indicating whether or not the given `value` is a Promise.
	 * You can use the generic argument to assert a specific type of Promise.
	 *
	 * i.e. `Promise.is<number>(x)` => `x is Promise<number>`
	 * @param value The value to verify
	 */
	is: <T = unknown>(value: unknown) => value is Promise<T>;

	/**
	 * Creates a new Promise.
	 * @param executor A callback used to initialize the promise. This callback is passed a resolve
	 * callback used resolve the promise with a value or the result of another promise,
	 * a reject callback used to reject the promise with a provided reason or error,
	 * and an onCancel function which may be used to register a cancellation hook by calling it with
	 * a function which will be called if the Promise is cancelled, allowing you to implement abort semantics.
	 */
	new <T>(
		executor: (
			resolve: (...values: PromiseResolveArguments<T> | [T] | [PromiseLike<T>]) => void,
			reject: (reason?: any) => void,
			onCancel: (cancellationHook: () => void) => void,
		) => void,
	): Promise<T>;
}

declare var Promise: PromiseConstructor;

/** Placeholder that sometimes helps force TS to display what you want it to. */
type _<T> = T;

/**
 * Make all properties in T optional
 */
type Partial<T> = { [P in keyof T]?: T[P] };

/**
 * Make all properties in T required
 */
type Required<T> = { [P in keyof T]-?: T[P] };

/**
 * Make all properties in T readonly
 */
type Readonly<T> = { readonly [P in keyof T]: T[P] };

/**
 * Make all properties in T non-readonly.
 */
type Writable<T> = { -readonly [P in keyof T]: T[P] };

/**
 * From T pick a set of properties K
 */
type Pick<T, K extends keyof T> = { [P in K]: T[P] };

/** Returns a subset of type T which excludes properties K */
type Omit<T, K extends keyof T> = Pick<T, Exclude<keyof T, K>>;

/**
 * Construct a type with a set of properties K of type T
 */
type Record<K extends keyof any, T> = { [P in K]: T };

/**
 * Exclude from T those types that are assignable to U
 */
type Exclude<T, U> = T extends U ? never : T;

/**
 * Extract from T those types that are assignable to U
 */
type Extract<T, U> = T extends U ? T : never;

/**
 * Exclude null and undefined from T
 */
type NonNullable<T> = unknown extends T ? defined : T extends null | undefined ? never : T;

/**
 * Obtain the parameters of a function type in a `tuple | never`.
 */
type Parameters<T extends (...args: any) => any> = T extends (...args: infer P) => any ? P : never;

/**
 * Obtain the parameters of a constructor function type in a `tuple | never`
 */
type ConstructorParameters<T extends new (...args: any) => any> = T extends new (...args: infer P) => any ? P : never;

/**
 * Obtain the return type of a function type
 */
type ReturnType<T extends (...args: Array<any>) => any> = T extends (...args: Array<any>) => infer R ? R : any;

/**
 * Obtain the return type of a constructor function type
 */
type InstanceType<T extends new (...args: Array<any>) => any> = T extends new (...args: Array<any>) => infer R
	? R
	: any;

/** Combines a series of intersections into one object, e.g. { x: number } & { y: number } becomes { x: number, y: number } */
type Reconstruct<T> = _<{ [k in keyof T]: T[k] }>;

/** Converts a series of object unions to a series of intersections, e.g. A | B becomes A & B */
type UnionToIntersection<U> = (U extends object ? (k: U) => void : never) extends (k: infer I) => void ? I : never;

/**
 * Extracts the type of the 'this' parameter of a function type, or 'unknown' if the function type has no 'this' parameter.
 */
type ThisParameterType<T> = T extends (this: infer U, ...args: any[]) => any ? U : unknown;

/**
 * Removes the 'this' parameter from a function type.
 */
type OmitThisParameter<T> = unknown extends ThisParameterType<T>
	? T
	: T extends (...args: infer A) => infer R
	? (...args: A) => R
	: T;
