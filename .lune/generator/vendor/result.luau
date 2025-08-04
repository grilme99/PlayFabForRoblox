-- https://lukadev-0.github.io/util.luau/reference/result

export type Result<T, E> = typeof(setmetatable(
    {} :: {
        _ok: boolean,
        _v: T,
        _e: E,
    },
    {} :: ResultImpl
))

export type ResultImpl = {
    __index: ResultImpl,
    __tostring: <T, E>(self: Result<T, E>) -> string,
    __eq: <T, E>(self: Result<T, E>, other: Result<T, E>) -> boolean,

    Ok: <T>(value: T) -> Result<T, any>,
    Err: <E>(err: E) -> Result<any, E>,
    try: <T, U...>(f: (U...) -> T, U...) -> Result<T, unknown>,
    is: (value: any) -> boolean,
    isOk: <T, E>(self: Result<T, E>) -> boolean,
    isOkAnd: <T, E>(self: Result<T, E>, f: (T) -> boolean) -> boolean,
    isErr: <T, E>(self: Result<T, E>) -> boolean,
    isErrAnd: <T, E>(self: Result<T, E>, f: (E) -> boolean) -> boolean,
    map: <T, E, U>(self: Result<T, E>, f: (T) -> U) -> Result<U, E>,
    mapOr: <T, E, U>(self: Result<T, E>, default: U, f: (T) -> U) -> U,
    mapOrElse: <T, E, U>(self: Result<T, E>, default: (E) -> U, f: (T) -> U) -> U,
    mapErr: <T, E, F>(self: Result<T, E>, f: (E) -> F) -> Result<T, F>,
    expect: <T, E>(self: Result<T, E>, msg: string) -> T,
    unwrap: <T, E>(self: Result<T, E>) -> T,
    expectErr: <T, E>(self: Result<T, E>, msg: string) -> E,
    unwrapErr: <T, E>(self: Result<T, E>) -> E,
    andRes: <T, E, U>(self: Result<T, E>, res: Result<U, E>) -> Result<U, E>,
    andThen: <T, E, U>(self: Result<T, E>, f: (T) -> Result<U, E>) -> Result<U, E>,
    orRes: <T, E, F>(self: Result<T, E>, res: Result<T, F>) -> Result<T, F>,
    orElse: <T, E, F>(self: Result<T, E>, f: (E) -> Result<T, F>) -> Result<T, F>,
    unwrapOr: <T, E>(self: Result<T, E>, default: T) -> T,
    unwrapOrElse: <T, E>(self: Result<T, E>, f: (E) -> T) -> T,
    match: <T, E, U>(self: Result<T, E>, f: { Ok: (T) -> U, Err: (E) -> U }) -> U,
    unpack: <T, E>(self: Result<T, E>) -> (T, E),
}

--[=[
  @class Result

  Represents a value that is either success (`Ok`) or failure (`Err`).

  Results can be used as an alternative to throwing errors. It requires
  you to eplicitly handle both cases, which can prevent unexpected
  errors from being thrown.

  `Result<T, E>` is a generic type with two type parameters: `T` and `E`:
    - `T` is the type of the success value.
    - `E` is the type of the error value.
]=]
local Result = {} :: ResultImpl
Result.__index = Result

--[=[
  Creates a new `Ok` with the given value.
]=]
function Result.Ok(value)
    local self = setmetatable({ _ok = true :: true, _v = value }, Result)
    return table.freeze(self) :: any
end

--[=[
  Creates a new `Err` with the given error.
]=]
function Result.Err(err)
    local self = setmetatable({ _ok = false :: false, _e = err }, Result)
    return table.freeze(self) :: any
end

--[=[
	Calls the given function and returns a `Result` with the result of the
	function. If the function throws an error, it will be caught and returned
	as an `Err`.
]=]
function Result.try(f, ...)
    local ok, res = pcall(f :: any, ...)
    if ok then
        return Result.Ok(res)
    end
    return Result.Err(res)
end

--[=[
	Returns true if the given value is a `Result`.
]=]
function Result.is(value)
    return typeof(value) == "table" and getmetatable(value) == Result
end

--[=[
  Returns true if the result is `Ok`.
]=]
function Result.isOk(self)
    return self._ok
end

--[=[
  Returns true if the result is `Ok` and the value matches the given
  predicate.
]=]
function Result.isOkAnd(self, f)
    return self._ok and f(self._v)
end

--[=[
  Returns true if the result is `Err`.
]=]
function Result.isErr(self)
    return not self._ok
end

--[=[
  Returns true if the result is `Err` and the error matches the given
  predicate.
]=]
function Result.isErrAnd(self, f)
    return not self._ok and f(self._e)
end

--[=[
	Calls the given function with the contained `Ok` value and returns a
	`Result` with the result of the function. Leaving an `Err` value untouched.
]=]
function Result.map(self, f)
    if not self._ok then
        return self :: Result<any, any>
    end
    return Result.Ok((f :: any)(self._v))
end

--[=[
	Calls the given function with the contained `Ok` value and returns the
	result, otherwise returns the given default value.
]=]
function Result.mapOr(self, default, f)
    if not self._ok then
        return default
    end
    return f(self._v)
end

--[=[
	Calls the given function with the contained `Ok` value and returns the
	result, otherwise calls the given function with the contained `Err` value.
]=]
function Result.mapOrElse(self, default, f)
    if not self._ok then
        return default(self._e)
    end
    return f(self._v)
end

--[=[
	Calls the given function with the contained `Err` value and returns a
	`Result` with the result of the function. Leaving an `Ok` value untouched.
]=]
function Result.mapErr(self, f)
    if self._ok then
        return self :: Result<any, any>
    end
    return Result.Err((f :: any)(self._e))
end

--[=[
	Returns the contained `Ok`. Otherwise an error is thrown with the given message.
]=]
function Result.expect(self, msg)
    if not self._ok then
        error(msg, 2)
    end
    return self._v
end

--[=[
	Returns the contained `Ok`. Otherwise the contained `Err` value is thrown.
]=]
function Result.unwrap(self)
    if not self._ok then
        error(self._e :: any, 2)
    end
    return self._v
end

--[=[
	Returns the contained `Err`. Otherwise an error is thrown with the given message.
]=]
function Result.expectErr(self, msg)
    if self._ok then
        error(msg, 2)
    end
    return self._e
end

--[=[
	Returns the contained `Err`. Otherwise the contained `Ok` value is thrown.
]=]
function Result.unwrapErr(self)
    if self._ok then
        error(self._v :: any, 2)
    end
    return self._e
end

--[=[
	Returns `res` if the result is `Ok`, otherwise returns the `Err`.	
]=]
function Result.andRes(self, res)
    if self._ok then
        return res
    end
    return self :: Result<any, any>
end

--[=[
	Calls the given function with the contained `Ok` value and returns the
	result, otherwise returns the `Err`.
]=]
function Result.andThen(self, f)
    if self._ok then
        return f(self._v)
    end
    return self :: Result<any, any>
end

--[=[
	Returns `res` if the result is `Err`, otherwise returns the `Ok`.
]=]
function Result.orRes(self, res)
    if not self._ok then
        return res
    end
    return self :: Result<any, any>
end

--[=[
	Calls the given function with the contained `Err` value and returns the
	result, otherwise returns the `Ok`.
]=]
function Result.orElse(self, f)
    if not self._ok then
        return f(self._e)
    end
    return self :: Result<any, any>
end

--[=[
	Returns the contained `Ok` value, or the given default value.
]=]
function Result.unwrapOr(self, default)
    if self._ok then
        return self._v
    end
    return default
end

--[=[
	Returns the contained `Ok` value, or calls the given function with the
	contained `Err` value.
]=]
function Result.unwrapOrElse(self, f)
    if self._ok then
        return self._v
    end
    return f(self._e)
end

--[=[
	Takes a table containing an `Ok` and `Err` function. If the option
	is a `Ok`, calls the `Ok` function with the contained `Ok` value,
	otherwise calls the `Err` function with the contained `Err`. The
	result of the function call is returned.
]=]
function Result.match(self, f)
    if self._ok then
        return f.Ok(self._v)
    end
    return f.Err(self._e)
end

--[=[
	Returns a tuple where the first value is the contained `Ok` value or nil and
	the second value is the contained `Err` value or nil.
]=]
function Result.unpack(self)
    return self._v, self._e
end

local stdio = require("@lune/stdio")
function Result.__tostring(self: any)
    if self._ok then
        if typeof(self._v) == "string" then
            return string.format("Result::Ok(%q)", self._v)
        else
            return `Result::Ok({stdio.format(self._v)})`
        end
    end

    if typeof(self._e) == "string" then
        return string.format("Result::Err(%q)", self._e)
    else
        return `Result::Err({stdio.format(self._e)})`
    end
end

--[=[
	Returns `true` if both results are `Ok` or `Err` and their values are equal.
	Othwerwise returns `false`.
]=]
function Result.__eq(self, other)
    if Result.is(other) then
        if self._ok and other._ok then
            return self._v == other._v
        elseif not self._ok and not other._ok then
            return self._e == other._e
        end
    end
    return false
end

return Result
