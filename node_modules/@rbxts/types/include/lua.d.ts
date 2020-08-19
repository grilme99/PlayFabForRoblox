/// <reference no-default-lib="true"/>
/// <reference path="es.d.ts" />
/// <reference path="generated/None.d.ts" />

// LUA API

type LuaTuple<T extends Array<any>> = T & { readonly LUA_TUPLE: never };

/** A table that is shared between all scripts of the same context level. */
interface _G {}
declare const _G: _G;

/** A string containing the current interpreter version. */
declare const _VERSION: string;

/** Throws an error if the provided value is false or nil. */
declare function assert<T>(condition: T, message?: string): asserts condition is Exclude<T, false | undefined>;

/** Performs an operation on the Lua garbage collector based on the specified option. Roblox's Lua sandbox only allows the "count" option to be used, so none of the other standard options are available. The "count" option returns the total memory in use by Lua (in kilobytes). */
declare function collectgarbage(option: "count"): number;

/** Terminates the last protected function called and outputs message as an error message. If the function containing the error is not called in a protected function (pcall), then the script which called the function will terminate. The error function itself never returns and acts like a script error. The level argument specifies how to get the error position. With level 1 (the default), the error position is where the error function was called. Level 2 points the error to where the function that called error was called; and so on. Passing a level 0 avoids the addition of error position information to the message. */
declare function error(message?: string, level?: number): never;

/** Returns the current environment in use by the function. If provided with a function, the environment of the function will be returned as an array. If provided with an integer, getfenv will provide the environment of the function at the provided stack level: Level 1 is the function calling getfenv. If stack is 0, getfenv returns the global environment of the current script. When using getfenv to get the current environment of a script, it will return the same table every time within the specific thread. */
declare function getfenv(stack: number): { script: LuaSourceContainer };

/** Returns the metatable of the specified object if it has one, otherwise returns nil. If the object does have a metatable, but the metatable has a __metatable field set, the value of __metatable will be returned instead. */
declare function getmetatable(object: object): unknown;

/** Prints a list of parameters to console. */
declare function print(...params: Array<unknown>): void;

/** Checks whether v1 is equal to v2, without invoking any metamethod. */
declare function rawequal(v1: unknown, v2: unknown): boolean;

/** Gets the real value of table[index], without invoking any metamethod. */
declare function rawget(t: unknown, index: unknown): unknown;

/** Sets the real value of table[index] to a given value, without invoking any metamethod. */
declare function rawset(t: unknown, index: unknown, value: unknown): void;

/** Returns all arguments after argument number index. */
declare function select(index: number, ...args: Array<unknown>): Array<unknown>;

/** Returns the total number of arguments that were passed after the cmd argument. */
declare function select(cmd: "#", ...args: Array<unknown>): number;

/** Attempts to convert the arg into a number with a specified base to interpret the value in. If it cannot be converted, this function returns nil. The base may be any integer between 2 and 36, inclusive. In bases above 10, the letter 'A' (in either upper or lower case) represents 10, 'B' represents 11, and so forth, with 'Z' representing 35. In base 10 (the default), the number may have a decimal part, as well as an optional exponent part. In other bases, only unsigned integers are accepted. */
declare function tonumber(arg: unknown, base?: number): number | undefined;

/** Receives an argument of any type and converts it to a string in a reasonable format. If the metatable of e has a "__tostring" field, then tostring calls the corresponding value with e as an argument and uses the result of the call as its result. For complete control of how numbers are converted, use string.format. */
declare function tostring(value: unknown): string;

/** Calls the function func with the given arguments in protected mode. This means that any error inside func is not propagated; instead, pcall catches the error and returns a status code. Its first result is the status code (a boolean), which is true if the call succeeds without errors. In such case, pcall also returns all results from the call, after this first result. In case of any error, pcall returns false plus the error message. */
declare function pcall<T extends Array<any>, U>(
	func: (...args: T) => U,
): LuaTuple<
	U extends [infer A]
		? [true, A] | [false, string]
		: U extends [infer A, infer B]
		? [true, A, B] | [false, string, undefined]
		: U extends [infer A, infer B, infer C]
		? [true, A, B, C] | [false, string, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D]
		? [true, A, B, C, D] | [false, string, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E]
		? [true, A, B, C, D, E] | [false, string, undefined, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E, infer F]
		? [true, A, B, C, D, E, F] | [false, string, undefined, undefined, undefined, undefined, undefined]
		: [true, U] | [false, string]
>;

/** Calls the function func with the given arguments in protected mode. This means that any error inside func is not propagated; instead, pcall catches the error and returns a status code. Its first result is the status code (a boolean), which is true if the call succeeds without errors. In such case, pcall also returns all results from the call, after this first result. In case of any error, pcall returns false plus the error message. */
declare function pcall<T extends Array<any>, U>(
	func: (...args: T) => U,
	...args: T
): LuaTuple<
	U extends [infer A]
		? [true, A] | [false, string]
		: U extends [infer A, infer B]
		? [true, A, B] | [false, string, undefined]
		: U extends [infer A, infer B, infer C]
		? [true, A, B, C] | [false, string, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D]
		? [true, A, B, C, D] | [false, string, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E]
		? [true, A, B, C, D, E] | [false, string, undefined, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E, infer F]
		? [true, A, B, C, D, E, F] | [false, string, undefined, undefined, undefined, undefined, undefined]
		: [true, U] | [false, string]
>;

/** Calls the function func with the given arguments in protected mode. This means that any error inside func is not propagated; instead, xpcall catches the error and returns a status code. Its first result is the status code (a boolean), which is true if the call succeeds without errors. In such case, xpcall also returns all results from the call, after this first result. In case of any error, xpcall returns false plus the error message. */
declare function xpcall<T extends Array<any>, U>(
	func: (...args: T) => U,
): LuaTuple<
	U extends [infer A]
		? [true, A] | [false, string]
		: U extends [infer A, infer B]
		? [true, A, B] | [false, string, undefined]
		: U extends [infer A, infer B, infer C]
		? [true, A, B, C] | [false, string, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D]
		? [true, A, B, C, D] | [false, string, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E]
		? [true, A, B, C, D, E] | [false, string, undefined, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E, infer F]
		? [true, A, B, C, D, E, F] | [false, string, undefined, undefined, undefined, undefined, undefined]
		: [true, U] | [false, string]
>;

/** Calls the function func with the given arguments in protected mode. This means that any error inside func is not propagated; instead, xpcall catches the error and returns a status code. Its first result is the status code (a boolean), which is true if the call succeeds without errors. In such case, xpcall also returns all results from the call, after this first result. In case of any error, pcall returns false plus the error message. */
declare function xpcall<T extends Array<any>, U>(
	func: (...args: T) => U,
	...args: T
): LuaTuple<
	U extends [infer A]
		? [true, A] | [false, string]
		: U extends [infer A, infer B]
		? [true, A, B] | [false, string, undefined]
		: U extends [infer A, infer B, infer C]
		? [true, A, B, C] | [false, string, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D]
		? [true, A, B, C, D] | [false, string, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E]
		? [true, A, B, C, D, E] | [false, string, undefined, undefined, undefined, undefined]
		: U extends [infer A, infer B, infer C, infer D, infer E, infer F]
		? [true, A, B, C, D, E, F] | [false, string, undefined, undefined, undefined, undefined, undefined]
		: [true, U] | [false, string]
>;

interface LuaMetatable<T> {
	__index?: (self: T, index: any) => void;
	__newindex?: (self: T, index: any, value: any) => void;
	__add?: (self: T, other: T) => T;
	__sub?: (self: T, other: T) => T;
	__mul?: (self: T, other: T) => T;
	__div?: (self: T, other: T) => T;
	__mod?: (self: T, other: T) => T;
	__pow?: (self: T, other: T) => T;
	__unm?: (self: T) => T;
	__eq?: (self: T, other: T) => boolean;
	__lt?: (self: T, other: T) => boolean;
	__le?: (self: T, other: T) => boolean;
	__call?: (self: T, ...args: Array<any>) => void;
	__concat?: (self: T, ...args: Array<any>) => string;
	__tostring?: (self: T) => string;
	__len?: (self: T) => number;
	__mode?: "k" | "v" | "kv";
	__metatable?: string;
}

/** Sets the metatable for the given table. If `metatable` is nil, the metatable of the given table is removed. If the original metatable has a "__metatable" field, this will raise an error. This function returns the table t, which was passed to the function. */
declare function setmetatable<T extends object>(object: T, metatable: LuaMetatable<T>): T;

/** An object the represents a date or time. Used with `os.date` and `os.time`. */
interface DateTable {
	/** The year. */
	year: number;
	/** The month. [1, 12] */
	month: number;
	/** The day. [1, 31] */
	day: number;

	/** The hour. [0, 23] */
	hour?: number;
	/** The minute. [0, 59] */
	min?: number;
	/** The second. [0, 59] */
	sec?: number;
	/** Whether this object represents a daylight savings time. */
	isdst?: boolean;
	/** The number of days into the year. [1, 366] */
	yday?: number;
	/** The day of the week. [1, 7] */
	wday?: number;
}

declare namespace os {
	/** Returns the number of seconds of CPU time for the program. It's typical use is to benchmark a piece of code. */
	function clock(): number;
	/** Returns the current number of seconds since Jan 1, 1970 in the UTC timezone. */
	function time(): number;
	/** Returns the number of seconds past Jan 1, 1970 in the UTC timezone for a given dateTable object. */
	function time(dateTable: DateTable): number;
	function date(formatString: "*t" | "!*t", time?: number): Required<DateTable>;
	function difftime(t2: number, t1: number): number;
}

declare namespace debug {
	function traceback(message?: string, level?: number): string;
	function traceback(thread: thread, message?: string, level?: number): string;
	function profilebegin(profileName: string): void;
	function profileend(): void;
}

/** @rbxts string */
interface String {
	/** Returns the internal numerical codes of the characters `s[i]`, `s[i+1]`, `...`, `s[j]`. The default value for i is 1; the default value for j is i. These indices are corrected following the same rules of function string.sub. */
	byte(this: string, i?: number, j?: number): LuaTuple<Array<number>>;

	/** Looks for the first match of pattern in the string s. If it finds a match, then find returns the indices of s where this occurrence starts and ends, as well as any matches after that. Otherwise, it returns nil. A third, optional numerical argument init specifies where to start the search; its default value is 1 and can be negative. A value of true as a fourth, optional argument plain turns off the pattern matching facilities, so the function does a plain "find substring" operation, with no characters in the pattern being considered "magic". Note that if `plain` is given, then `init` must be given as well. */
	find(
		this: string,
		pattern: string,
		init?: number,
		plain?: boolean,
	): LuaTuple<[number, number, ...Array<string | number>] | Array<undefined>>;
	// A capture may be a number when we use `()` to capture the location

	/** Returns a formatted version of its variable number of arguments following the description given in its first argument (which must be a string). */
	format(this: string, ...args: Array<number | string>): string;

	/** Returns an iterator function that, each time it is called, returns the next captures from pattern over the string s. */
	gmatch(this: string, pattern: string): IterableFunction<LuaTuple<Array<string | number>>>;
	// A capture may be a number when we use `()` to capture the location

	/** Returns a copy of s in which all (or the first n, if given) occurrences of the pattern have been replaced by a replacement string specified by repl, which can be a string, a table, or a function. gsub also returns, as its second value, the total number of matches that occurred. */
	gsub(this: string, pattern: string, repl: string, n?: number): LuaTuple<[string, number]>;
	gsub(this: string, pattern: string, repl: number, n?: number): LuaTuple<[string, number]>;
	gsub(
		this: string,
		pattern: string,
		repl: (value: string) => string | number | undefined,
		n?: number,
	): LuaTuple<[string, number]>;
	gsub(this: string, pattern: string, repl: Map<string, string | number>, n?: number): LuaTuple<[string, number]>;
	gsub(
		this: string,
		pattern: string,
		repl: { [index: string]: string | number },
		n?: number,
	): LuaTuple<[string, number]>;

	/** Receives a string and returns a copy of this string with all uppercase letters changed to lowercase. */
	lower(this: string): string;

	/** Looks for the first match of pattern in the string s. If a match is found it is returned. Otherwise, this returns nil. A third, optional numerical argument init specifies where to start the search; its default value is 1 and can be negative. */
	match(this: string, pattern: string, init?: number): LuaTuple<Array<string | number> | Array<undefined>>;
	// A capture may be a number when we use `()` to capture the location

	/** Returns a string that is the concatenation of n copies of the string s separated by the string sep. */
	rep(this: string, n: number): string;

	/** Returns a string that is the string s reversed. */
	reverse(this: string): string;

	/** Returns an array of substrings, separated by each `sep`.
	 * Does not handle Lua character classes, thus, the separator string will be interpreted literally.
	 */
	split(this: string, sep: string): Array<string>;

	/** Returns the substring of s that starts at i and continues until j; i and j can be negative. If j is absent, then it is assumed to be equal to -1 (which is the same as the string length). */
	sub(this: string, i: number, j?: number): string;

	/** Receives a string and returns a copy of this string with all lowercase letters changed to uppercase. All other characters are left unchanged. */
	upper(this: string): string;
}

declare namespace string {
	/** Receives zero or more integers. Returns a string with length equal to the number of arguments, in which each character has the internal numerical code equal to its corresponding argument. */
	function char(...args: Array<number>): string;
}

declare namespace math {
	/** The number π is a mathematical constant. Originally defined as the ratio of a circle's circumference to its diameter, it now has various equivalent definitions and appears in many formulas in all areas of mathematics and physics. It is approximately equal to 3.14159. */
	const pi: number;

	/** The value HUGE_VAL, a value larger than or equal to any other numerical value. */
	const huge: number;

	/** Returns the absolute value of x. */
	function abs(n: number): number;

	/** Returns the arc cosine of x. */
	function acos(n: number): number;

	/** Returns the arc sine of x. */
	function asin(n: number): number;

	/** Returns the arc tangent of x (in radians). */
	function atan(n: number): number;

	/** Returns the arc tangent of y/x (in radians), but uses the signs of both parameters to find the quadrant of the result. It also handles correctly the case of x being zero. */
	function atan2(y: number, x: number): number;

	/** Returns the smallest integer larger than or equal to x. */
	function ceil(n: number): number;

	/** Returns the cosine of x (assumed to be in radians). */
	function cos(n: number): number;

	/** Returns the hyperbolic cosine of x. */
	function cosh(n: number): number;

	/** Returns the angle x (given in radians) in degrees. */
	function deg(n: number): number;

	/** Returns the value e^x. */
	function exp(n: number): number;

	/** Returns the largest integer smaller than or equal to x. */
	function floor(n: number): number;

	/** Returns the remainder of the division of x by y that rounds the quotient towards zero. */
	function fmod(x: number, y: number): number;

	/** Returns m and e such that x = m*2^e, e is an integer and the absolute value of m is in the range [0.5, 1) (or zero when x is zero). */
	function frexp(n: number): LuaTuple<[number, number]>;

	/** Returns m*2^e (e should be an integer). */
	function ldexp(m: number, e: number): number;

	/** Returns the natural logarithm of x. If base is provided, returns the logarithm of x with respect to base, which is equivalent to log(x) / log(base) */
	function log(x: number, base?: number): number;

	/** Returns the base-10 logarithm of x. */
	function log10(n: number): number;

	/** Returns the maximum value among the numbers passed to the function. */
	function max(...n: Array<number>): number;

	/** Returns the minimum value among the numbers passed to the function. */
	function min(...n: Array<number>): number;

	/** Returns two numbers, the integral part of x and the fractional part of x. */
	function modf(n: number): LuaTuple<[number, number]>;

	/** Returns x^y. (You can also use the expression x^y to compute this value.) */
	function pow(x: number, y: number): number;

	/** Returns the angle x (given in degrees) in radians. */
	function rad(n: number): number;

	/** This function is an interface to the simple pseudo-random generator function rand provided by ANSI C. (No guarantees can be given for its statistical properties.) Returns a uniform pseudo-random real number in the range [0,1). */
	function random(): number;

	/** This function is an interface to the simple pseudo-random generator function rand provided by ANSI C. (No guarantees can be given for its statistical properties.) Returns a uniform pseudo-random integer in the range [1, m]. */
	function random(max: number): number;

	/** This function is an interface to the simple pseudo-random generator function rand provided by ANSI C. (No guarantees can be given for its statistical properties.) Returns a uniform pseudo-random integer in the range [m, n]. */
	function random(min: number, max: number): number;

	/** Sets x as the seed for the pseudo-random generator: equal seeds produce equal sequences of numbers. */
	function randomseed(seed: number): number;

	/** Returns -1 if `x < 0`, 0 if `x == 0`, or 1 if `x > 0`. */
	function sign(n: number): number;

	/** Returns the sine of x (assumed to be in radians). */
	function sin(n: number): number;

	/** Returns the hyperbolic sine of x. */
	function sinh(n: number): number;

	/** Returns the square root of x. (You can also use the expression `x^0.5` to compute this value.) */
	function sqrt(n: number): number;

	/** Returns the tangent of x (assumed to be in radians). */
	function tan(n: number): number;

	/** Returns the hyperbolic tangent of x. */
	function tanh(n: number): number;
}

/**
 * Unless otherwise stated, all functions accept numeric arguments in the range `(-2^51, +2^51)`;
 * each argument is normalized to the remainder of its division by `2^32` and truncated to an integer
 * (in some unspecified way), so that its final value falls in the range `[0, 2^32 - 1]`.
 * Similarly, all results are in the range `[0, 2^32 - 1]`.
 * Note that `bit32.bnot(0)` is `0xFFFFFFFF`, which is different from -1.
 */
declare namespace bit32 {
	/**
	 * Returns the number `x` shifted `displacement` bits to the right. The number `displacement` may be any representable integer.
	 * Negative displacements shift to the left. This shift operation is what is called arithmetic shift.
	 * Vacant bits on the left are filled with copies of the higher bit of `x`; vacant bits on the right are filled
	 * with zeros. In particular, displacements with absolute values higher than 31 result in zero or `0xFFFFFFFF`
	 * (all original bits are shifted out).
	 */
	function arshift(x: number, displacement: number): number;

	/** Returns the bitwise _and_ of its operands. */
	function band(...operands: Array<number>): number;

	/**
	 * Returns the bitwise negation of `x`. For any integer `x`, the following identity holds:
	 *
	 * `assert(bit32.bnot(x) == (-1 - x) % 2^32)`
	 */
	function bnot(x: number): number;

	/** Returns the bitwise _or_ of its operands. */
	function bor(...operands: Array<number>): number;

	/** Returns a boolean signaling whether the bitwise _and_ of its operands is different from zero. */
	function btest(...operands: Array<number>): boolean;

	/** Returns the bitwise _exclusive or_ of its operands. */
	function bxor(...operands: Array<number>): number;

	/**
	 * Returns the unsigned number formed by the bits `field` to `field + width - 1` from `n`.
	 * Bits are numbered from 0 (least significant) to 31 (most significant).
	 * All accessed bits must be in the range `[0, 31]`.
	 *
	 * The default for `width` is 1.
	 */
	function extract(n: number, field: number, width?: number): number;

	/**
	 * Returns a copy of `n` with the bits `field` to `field + width - 1` replaced by the value `v`.
	 *
	 * See `bit32.extract` for details about `field` and `width`.
	 */
	function replace(n: number, v: number, field: number, width?: number): number;

	/**
	 * Returns the number `x` rotated `displacement` bits to the left. The number `displacement` may be any representable integer.
	 *
	 * For any valid displacement, the following identity holds:
	 *
	 * `assert(bit32.lrotate(x, displacement) == bit32.lrotate(x, displacement % 32))`
	 *
	 * In particular, negative displacements rotate to the right.
	 */
	function lrotate(x: number, displacement: number): number;

	/**
	 * Returns the number `x` shifted `displacement` bits to the left. The number `displacement` may be any representable integer.
	 * Negative displacements shift to the right. In any direction, vacant bits are filled with zeros.
	 * In particular, displacements with absolute values higher than 31 result in zero (all bits are shifted out).
	 *
	 * For positive displacements, the following equality holds:
	 *
	 * `assert(bit32.lshift(b, displacement) == (b * 2^displacement) % 2^32)`
	 */
	function lshift(x: number, displacement: number): number;

	/**
	 * Returns the number `x` rotated `displacement` bits to the right. The number `displacement` may be any representable integer.
	 *
	 * For any valid displacement, the following identity holds:
	 *
	 * `assert(bit32.rrotate(x, displacement) == bit32.rrotate(x, displacement % 32))`
	 *
	 * In particular, negative displacements rotate to the left.
	 */
	function rrotate(x: number, displacement: number): number;

	/**
	 * Returns the number `x` shifted `displacement` bits to the right. The number `displacement` may be any representable integer.
	 * Negative displacements shift to the left. In any direction, vacant bits are filled with zeros.
	 * In particular, displacements with absolute values higher than 31 result in zero (all bits are shifted out).
	 *
	 * For positive displacements, the following equality holds:
	 *
	 * `assert(bit32.rshift(b, displacement) == math.floor(b % 2^32 / 2^displacement))`
	 *
	 * This shift operation is what is called logical shift.
	 */
	function rshift(x: number, displacement: number): number;
}

declare namespace table {
	/** Sorts list elements in a given order, in-place, from `list[1]` to `list[#list]`. Comp is a function that receives two list elements and returns true when the first element must come before the second in the final order (so that `not comp(list[i+1],list[i])` will be true after the sort). */
	function sort<T>(t: Array<T>, comp?: (a: T, b: T) => boolean): void;
}

type thread = { readonly LUA_THREAD?: never };

declare namespace coroutine {
	/** Creates a new coroutine, with body f. f must be a Lua function. */
	function create(f: Function): thread;

	/** Starts or continues the execution of coroutine co. The first time you resume a coroutine, it starts running its body. The values val1, ... are passed as the arguments to the body function. If the coroutine has yielded, resume restarts it; the values val1, ... are passed as the results from the yield. If the coroutine runs without any errors, resume returns true plus any values passed to yield (if the coroutine yields) or any values returned by the body function (if the coroutine terminates). If there is any error, resume returns false plus the error message. */
	function resume(co: thread, ...params: Array<unknown>): unknown;

	/** Returns the running coroutine. */
	function running(): thread;

	/** Returns the status of coroutine co, as a string: 'running', if the coroutine is running (that is, it called status); 'suspended', if the coroutine is suspended in a call to yield, or if it has not started running yet; 'normal' if the coroutine is active but not running (that is, it has resumed another coroutine); and 'dead' if the coroutine has finished its body function, or if it has stopped with an error. */
	function status(co: thread): string;

	/** Creates a new coroutine, with body f. f must be a Lua function. Returns a function that resumes the coroutine each time it is called. Any arguments passed to the function behave as the extra arguments to resume. Returns the same values returned by resume, except the first boolean. In case of error, propagates the error. */
	function wrap<T extends Function>(f: T): T;

	/** Suspends the execution of the calling coroutine. Any arguments to yield are passed as extra results to resume. */
	function yield(...params: Array<unknown>): unknown;
}

declare function next<T extends readonly any[]>(
	object: T,
	index?: number,
): T extends readonly [infer A]
	? LuaTuple<[number, A]>
	: T extends readonly [infer A, infer B]
	? LuaTuple<[number, A | B]>
	: T extends readonly [infer A, infer B, infer C]
	? LuaTuple<[number, A | B | C]>
	: T extends readonly [infer A, infer B, infer C, infer D]
	? LuaTuple<[number, A | B | C | D]>
	: T extends readonly [infer A, infer B, infer C, infer D, infer E]
	? LuaTuple<[number, A | B | C | D | E]>
	: T extends readonly [infer A, infer B, infer C, infer D, infer E, infer F]
	? LuaTuple<[number, A | B | C | D | E | F]>
	: T extends readonly (infer U)[]
	? LuaTuple<Array<U>>
	: LuaTuple<[unknown, unknown]>;
declare function next<T extends any[]>(
	object: T,
	index?: number,
): T extends [infer A]
	? LuaTuple<[number, A]>
	: T extends [infer A, infer B]
	? LuaTuple<[number, A | B]>
	: T extends [infer A, infer B, infer C]
	? LuaTuple<[number, A | B | C]>
	: T extends [infer A, infer B, infer C, infer D]
	? LuaTuple<[number, A | B | C | D]>
	: T extends [infer A, infer B, infer C, infer D, infer E]
	? LuaTuple<[number, A | B | C | D | E]>
	: T extends [infer A, infer B, infer C, infer D, infer E, infer F]
	? LuaTuple<[number, A | B | C | D | E | F]>
	: T extends (infer U)[]
	? LuaTuple<Array<U>>
	: LuaTuple<[unknown, unknown]>;
declare function next<T>(object: Array<T>, index?: number): LuaTuple<[number, T]>;
declare function next<T>(object: Set<T>, index?: T): LuaTuple<[T, true]>;
declare function next<K, V>(object: Map<K, V>, index?: K): LuaTuple<[K, V]>;
declare function next<T>(object: T, index?: keyof T): LuaTuple<[keyof T, T[keyof T]]>;
declare function next(object: object, index?: unknown): LuaTuple<[unknown, unknown]>;
