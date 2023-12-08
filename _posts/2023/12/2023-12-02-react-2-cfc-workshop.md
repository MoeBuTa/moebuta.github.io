---
title: "React 2: CFC Workshop"
tags: React NextJS Typescript
categories: Tech
---

## React.JS

 - A Javascript library for building UIs.
 - Used for frontend development
 - React Native for mobile development
 - created and used by Facebook

### Functions are first class citizens

 - Functions can be **saved as variables**

    ```jsx
    let add = function () {
        const five = 3 + 2;
    }
    ```

 - Functions can be **passed as arguments**

    ```jsx
    function performTask(task) {
        task();
    }
   
    performTask(add);
    ```

 - Functions can be **returned from functions**

    ```jsx
    function foo() {
        return function() {
            //...
        };
    }
    foo
    foo();
    foo()();
    ```

### Variables are immutable

 - use **const** instead of **let**
    ```jsx
    let a = 4;
    a = 2 // mutates `a`
    ```
 - attributes of **objects** or elements in **arrays** can be modified even if declared with **const**

### Functions have no side effects

 - pure functions only calculate things based on their input and returns results without affecting anything outside itself.


### Hooks

 - special functions that allow developers to hook into **state** and **lifecycle** of react components
   - state: local data change over time
   - lifecycle: creation - updates - removal

 - useState
 - useEffect
 - useContext
 - useReducer
 - useMemo
 - useRef
 - useCallback

### Libraries:

 - component libraries
   - Material UI, React Bootstrap, headless UI
 - state management and data fetching
   - Redux Zustand, Jotai
   - Tanstack Query, SWR
 - Routing
   - React Router, TanStack Router
 - Forms
   - React Hook Form
 - Renderers
   - React Three Fiber, React Figma
 - Graphics and Animations
   - Framer Motion

## Next.JS

### Dynamic Routes

```jsx
import {useRouter} from 'next/router'

export default function Page(){
    const router = useRouter()
    return <p>Hi, {router.query.id}</p>
}

//url: localhost:3000/user/nicholas
//Hi, nicholas
```

### Linking and Navigating

```jsx
import Link from 'next/link'

function Home() {
    <Link href='/'>Home</Link>
}
```

 - Link is a drop in replacement for anchor tags, <a/>.
 - Use useRouter for redirects, navigate back in history, and more

### API Routes

Any file inside the folder pages/api is mapped to /api/* path and will be treated as an API endpoint instead of a page.

### Image Optimisation

 - Size Optimisation: Automatically serve correctly sized images
for each device, using modern image formats
like WebP and AVIF.
 - Faster Page Load: 
Images are only loaded when they enter the
viewport using native browser lazy loading,
with optional blur-up placeholders.

## Typescript

![cfc-ts](/assets/source/image/blog/cfc-ts.png)

### Arrays and Union Types

```typescript
let value: string | number | null = null
```

```typescript
let arr2: string[], arr3: Array<number>
let arr4: Array<string | number>
```

### Intersection

```typescript
type Human = {
   name: string;
};
type Student = {
   age: number;
};

const Volunteer: Human & Student = {
   name: "abc",
   age: 22,
}
```

### Objects

```typescript
interface Student {
    name: string;
    age?: number; // age: number | undefined
    studentNumber: number;
    gender: "male" | "female" | "other";
}

const student1: Student = {
    name: "abc",
    studentNumber: 123456;
    gender: "male",
};
```


```typescript
interface UWAStudent {
    name: string;
    studentNumber: number;
    DOB: Date;
    gender: "male" | "female" | "other";
}

interface StudentClub {
    name: string;
    isGuildAffiliated?: boolean;
}

interface GuildMember extends UWAStudent {
    isGuildMemeber?: boolean;
    clubs?: StudentClub[];
}

const student: GuildMember = {
    name: "abc",
    studentNumber: 123241,
    DOB: new Date(1999, 1, 1),
    gender: "male",
    isGuildMemeber: true,
    clubs: [{name: "cfc", isGuildAffiliated: true}],
}
```
