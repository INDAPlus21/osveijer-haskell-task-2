1. Varför kan man skriva utryck så som detta i Haskell?
```haskell
let evenNumbers = [ 2 * n | n <- [1..]]
print (take 1000000 evenNumbers)
```

Detta fungerar i haskell eftersom haskell använder "lazy-evaluation" vilket betyder att listan inte existerar förän man strikt kallar på den.

2. Vad innebär rekursion?

Rekursion är när något defineras av sig själv. Till exempel när en funktion kallar på sig själv.

3. Varför fungerar följande funktion i språk så som haskell och inte i t.ex javascript
```haskell
sum :: Integral n, Num n => n -> n -> n
sum s 0 = s
sum s n = sum (s + n) (pred n)
```
```javascript
function sum(s, n) {
     if(n == 0){
         return s;
     } else{
         return sum(s + n, n - 1);
     }
}
```

Det funkar i haskell eftersom haskell har pattern-matching functions vilket betyder att olika versioner av funktionen kan kallas beroende på värden på dess argument. Detta betyder att man inte behöver några if-statements inom funktionen som man behöver i andra språk.