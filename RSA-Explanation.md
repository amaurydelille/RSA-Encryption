##### Warning 
Let Bob be the person who want to send a data/message, and Alice the person who want the recover the data/message sent by Bob.

## Private and Public Keys preparation

Using these keys requires several preleminary calculations. At first, two coefficient $p$ and $q$ must be choosed, they must be prime together between them. To check if they respect this condition, the $PGCD(p, q)$ must be equal to $1$.

### Public Key

The **public key** is the tuple $(n, e)$ where n : $n=p\times q$ and $e$ an exponant such as : $PGCD(e, \varphi (n)) = 1$ where $\varphi (n) = (n-1)\times (q-1)$. 

Then to complete the exponant $e$, a "inverse" $d$ of it must be calculated, to find it we must calculate the Bézout Identity with the help of The Extend Euclidean Algorithm :$$ax + by = PGCD(a, b)=1$$
$$d \times e \equiv 1 [\varphi(n)]$$
$d$ represents the biggest digit/number of the two coefficients. 

To encrypt the given data (it can be a string, an array, an integer, etc...), it must be written as a string. That string is decomposed one by one in characters, and inserted in a list :
*exemple* : "$key$" $\rightarrow$ $[k;e;y]$

The particularity of my algorithm is that each letter that compose the data we want to encypt, is associated with a number that represents it rank in the latin alphabet. Now, each character is represented by its rank in the latin alphabet (1 = a, 2 = b, etc...). This operation make the encryption calculation easier, because now, for each character of our word, we just have to take it out of the list and apply the RSA-algorithm on it. 

## Encryption

Once the Public Key and the Private Key are calculated, $p$, $q$ and $\varphi(n)$ can be destroyed because we will not need them anymore : 
- Public Key : ($n, e$)
- Private Key : $d$ 

At first, Bruno recover the Alice's Public Key and calculate the encrypted data : $$x\equiv m^{e} [n]$$
Then he transmit the $x$ data/message to Alice.



