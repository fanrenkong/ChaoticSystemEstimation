# Parameters Estimation of Chaotic System for Single-Objective Optimization

---

### Chaotic System Instruction

#### 1. Loren

$$
\dot x_1(t)=a[x_2(t)-x_1(t)]\\
\dot x_2(t)=bx_1(t)-x_1(t)x_3(t)-x_2(t)\\
\dot x_3(t)=x_1(t)x_2(t)-cx_3(t)
$$

#### 2. Chen

$$
\dot x_1(t)=a(x_2(t)-x_1(t))\\
\dot x_2(t)=dx_1(t)-x_1(t)x_3(t)+cx_2(t)\\
\dot x_3(t)=x_1(t)x_2(t)-bx_3(t)
$$

#### 3. Newton-Leipnik

$$
\dot x_1(t)=-ax_1(t)+x_2(t)+10x_2(t)x_3(t)\\
\dot x_2(t)=-x_1(t)-0.4x_2(t)+5x_1(t)x_3(t)\\
\dot x_3(t)=bx_3(t)-5x_1(t)x_2(t)
$$

#### 4. Rossler

$$
\dot x_1(t)=-x_2(t)-x_3(t)\\
\dot x_2(t)=x_1(t)+ax_2(t)\\
\dot x_3(t)=bx_1(t)-cx_3(t)+x_1(t)x_3(t)
$$



#### 5. Volta

$$
\dot x_1(t)=-x_1(t)-ax_2(t)-x_2(t)x_3(t)\\
\dot x_2(t)=-x_2(t)-bx_1(t)-x_1(t)x_3(t)\\
\dot x_3(t)=cx_3(t)+x_1(t)x_2(t)+1
$$

### Usage:

```matlab
f = chaotic_system(x,func_num)
```

* x: the parameters to estimate
* func_num: function number

### Example:

```matlab
f = chaotic_system([9,27.5,2.6],1) # Calculate objective function of Loren chaotic system
```

