package.path = "../src/?.lua;"..package.path
require('fixed_import')

local a = FixedNumber.New(123)
local b = FixedNumber.New(456.789)

print("test number")
print(a + b)
print(a - b)
print(a * b)
print(a / b)
print(-a)
print(a == b)
print(a < b)
print(a <= b)

print("test math")
print(FixedMath.ToInt(a))
print(FixedMath.ToInt(b))
print(FixedMath.Floor(FixedNumber.New(-1.1)))
print(FixedMath.Floor(FixedNumber.New(1.1)))
print(FixedMath.Ceil(FixedNumber.New(1.1)))
print(FixedMath.Ceil(FixedNumber.New(-1.1)))
print(FixedMath.Round(FixedNumber.New(1.45)))
print(FixedMath.Round(FixedNumber.New(1.51)))
print(FixedMath.Round(FixedNumber.New(-1.45)))
print(FixedMath.Round(FixedNumber.New(-1.51)))
print(FixedMath.Clamp(a, FixedNumber.ZERO, b))

print(FixedMath.Pow(a, 3))
print(FixedMath.Pow(FixedNumber.New(1.123), -4))

print(FixedMath.Min(a, b))
print(FixedMath.Max(a, b))

print(FixedMath.Abs(a))

print(FixedMath.Sqrt(a))
print(math.sqrt(a:Raw()))

print(FixedMath.Sin(a))
print(math.sin(a:Raw()))
print(FixedMath.Cos(a))
print(math.cos(a:Raw()))
print(FixedMath.Asin(FixedNumber.New(0.6)))
print(math.asin(0.6))
print(FixedMath.Acos(FixedNumber.New(0.7)))
print(math.acos(0.7))
print(FixedMath.Atan2(b, a))
print(math.atan2(b:Raw(), a:Raw()))

print("test vector3")
local v1 = FixedVector3.New(1, 1, 1)
local v2 = FixedVector3.New(3, 3, 3)
print("v1 + v2 = "..tostring(v1 + v2))
print("v1 - v2 = "..tostring(v1 - v2))
print("v1 * 3  = "..tostring(v1 * FixedNumber.New(3)))
print("v1 / 3  = "..tostring(v1 / FixedNumber.New(3)))
print("-v1:"..tostring(-v1))
print("v1 == v2 :"..tostring(v1 == v2))
print("SqrMagnitude:"..tostring(v1:SqrMagnitude()))
print("Magnitude:"..tostring(v1:Magnitude()))
print("Normalize:"..tostring(v1:Normalize()))
print("ClampMagnitude:"..tostring(v1:ClampMagnitude(FixedNumber.New(3))))
print("SetNormalize:"..tostring(v1:Clone():SetNormalize()))
print("SqrDistance:"..tostring(FixedVector3.SqrDistance(v1, v2)))
print("Distance:"..tostring(FixedVector3.Distance(v1, v2)))
print("Dot:"..tostring(FixedVector3.Dot(v1, v2)))
print("Lerp:"..tostring(FixedVector3.Lerp(v1, v2, FixedNumber.New(0.5))))
print("Max:"..tostring(FixedVector3.Max(v1, v2)))
print("Min:"..tostring(FixedVector3.Min(v1, v2)))
print("Angle:"..tostring(FixedVector3.Angle(v1, v2)))
local a1 = FixedVector3.New(1, 1, 1)
local a2 = FixedVector3.New(2, 2, 2)
local a3 = FixedVector3.New(3, 3, 3)
a1, a2, a3 = FixedVector3.OrthoNormalize(a1, a2, a3)
print("OrthoNormalize a1:"..tostring(a1).." a2:"..tostring(a2).." a3:"..tostring(a3))
print("MoveTowards:"..tostring(FixedVector3.MoveTowards(v1, v2, FixedNumber.New(3))))
print("RotateTowards:"..tostring(FixedVector3.RotateTowards(v1, v2, FixedNumber.New(1), FixedNumber.New(1))))
local vec, velocity = FixedVector3.SmoothDamp(v1, v2, FixedNumber.New(1), FixedNumber.New(2), FixedNumber.New(0.33), FixedVector3.New(1, 1, 1))
print("SmoothDamp:"..tostring(vec).." velocity:"..tostring(velocity))
print("Scale:"..tostring(FixedVector3.Scale(v1, v2)))
print("Cross:"..tostring(FixedVector3.Cross(v1, v2)))
print("Reflect:"..tostring(FixedVector3.Reflect(v1, v2)))
print("Project:"..tostring(FixedVector3.Project(v1, v2)))
print("ProjectOnPlane:"..tostring(FixedVector3.ProjectOnPlane(v1, v2)))
print("Slerp:"..tostring(FixedVector3.Slerp(v1, v2, FixedNumber.New(0.5))))
print("AngleAroundAxis:"..tostring(FixedVector3.AngleAroundAxis(v1, v2, FixedVector3.New(1, 1, 1))))
print("Add:"..tostring(v1:Clone():Add(v2)))
print("Sub:"..tostring(v1:Clone():Sub(v2)))
print("Mul:"..tostring(v1:Clone():Mul(FixedNumber.New(2))))
print("Div:"..tostring(v1:Clone():Div(FixedNumber.New(2))))

print("test quaternion")
local q1 = FixedQuaternion.New(1, 1, 1, 1)
local q2 = FixedQuaternion.New(2, 2, 2, 2)
print("SetEuler:"..tostring(q1:Clone():SetEuler(FixedNumber.New(1), FixedNumber.New(2), FixedNumber.New(3))))
print("Normalize:"..tostring(q1:Normalize()))
print("SetNormalize:"..tostring(q1:Clone():Normalize()))
print("SetFromToRotation1:"..tostring(q1:Clone():SetFromToRotation1(FixedVector3.New(1, 2, 3), FixedVector3.New(7, 8, 9))))
print("SetFromToRotation:"..tostring(q1:Clone():SetFromToRotation(FixedVector3.New(1, 2, 3), FixedVector3.New(7, 8, 9))))
print("Inverse:"..tostring(q1:Inverse()))
print("SetIndentity:"..tostring(q1:Clone():SetIndentity()))
local angle, v = q1:ToAngleAxis()
print("ToAngleAxis angel:"..tostring(angle).." v:"..tostring(v))
print("ToEulerAngles:"..tostring(q1:ToEulerAngles()))
print("Forward:"..tostring(q1:Forward()))
print("MulVec3:"..tostring(q1:MulVec3(v2)))
print("Dot:"..tostring(FixedQuaternion.Dot(q1, q2)))
print("Angle:"..tostring(FixedQuaternion.Angle(q1, q2)))
print("AngleAxis:"..tostring(FixedQuaternion.AngleAxis(angle, v)))
print("Euler:"..tostring(FixedQuaternion.Euler(FixedNumber.New(1), FixedNumber.New(2), FixedNumber.New(3))))
print("FromToRotation:"..tostring(FixedQuaternion.FromToRotation(v1, FixedVector3.New(2, 3, 4))))
print("Lerp:"..tostring(FixedQuaternion.Lerp(q1, q2, FixedNumber.New(0.5))))
print("LookRotation:"..tostring(FixedQuaternion.LookRotation(v1, v2)))
print("Slerp:"..tostring(FixedQuaternion.Slerp(q1, q2, FixedNumber.New(0.5))))
print("RotateTowards:"..tostring(FixedQuaternion.RotateTowards(q1, q2, FixedNumber.New(15))))
print("mul:"..tostring(q1 * q2))
print("umn:"..tostring(-q1))
print("eq:"..tostring(q1 == q2))

print("test random")
local r1 = FixedRandom.New(123)
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
print(r1:Rand())
