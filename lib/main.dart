import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        title: 'Responsive App',
        home: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Responsive app'),
            ),
            body: ListView(
              children: [
                ListTile(
                  title: const Text(
                    'Method 1: Strict layout with fixed sizes of widgets and SizedBoxes as paddings',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveScreen1(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Method 2: Using MediaQuery to scale paddings and font sizes based on screen size',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveScreen2(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Method 3: Using Spacer widget to make flexible paddings',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveScreen3(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Method 4: Using ListView to make scrollable layout',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveScreen4(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text(
                    'Method 5: Using CustomScrollView and Slivers',
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ResponsiveScreen5(),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ResponsiveScreen1 extends StatelessWidget {
  const ResponsiveScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: const [
            SizedBox(height: 20),
            HeaderText(),
            SizedBox(height: 24),
            ProfileAvatar(),
            SizedBox(height: 16),
            NameText(),
            RoleText(),
            SizedBox(height: 16),
            AddressText(),
            SizedBox(height: 72),
            DescriptionText(),
            SizedBox(height: 24),
            ContactButton(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class ResponsiveScreen2 extends StatelessWidget {
  const ResponsiveScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    const designHeight = 715.0;
    const designWidth = 400.0;
    final screenHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.vertical;
    final screenWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.horizontal;

    final scaleHeightFactor = screenHeight / designHeight;
    final scaleWidthFactor = screenWidth / designWidth;
    final scaleFontFactor = scaleWidthFactor;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: scaleFontFactor,
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight * scaleHeightFactor),
          child: AppBar(
            title: const Text('Responsive Screen'),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16 * scaleWidthFactor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20 * scaleHeightFactor),
              const HeaderText(),
              SizedBox(height: 24 * scaleHeightFactor),
              ProfileAvatar(radius: 32 * scaleWidthFactor),
              SizedBox(height: 16 * scaleHeightFactor),
              const NameText(),
              const RoleText(),
              SizedBox(height: 16 * scaleHeightFactor),
              const AddressText(),
              SizedBox(height: 72 * scaleHeightFactor),
              DescriptionText(
                padding: EdgeInsets.symmetric(
                  horizontal: 12 * scaleWidthFactor,
                  vertical: 12 * scaleHeightFactor,
                ),
              ),
              SizedBox(height: 24 * scaleHeightFactor),
              ContactButton(height: 50 * scaleHeightFactor),
              SizedBox(height: 24 * scaleHeightFactor),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveScreen3 extends StatelessWidget {
  const ResponsiveScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Spacer(flex: 20),
            HeaderText(),
            Spacer(flex: 24),
            ProfileAvatar(),
            Spacer(flex: 16),
            NameText(),
            RoleText(),
            Spacer(flex: 16),
            AddressText(),
            Spacer(flex: 72),
            DescriptionText(),
            Spacer(flex: 24),
            ContactButton(),
            Spacer(flex: 24),
          ],
        ),
      ),
    );
  }
}

class ResponsiveScreen4 extends StatelessWidget {
  const ResponsiveScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          SizedBox(height: 20),
          HeaderText(),
          SizedBox(height: 24),
          ProfileAvatar(),
          SizedBox(height: 16),
          NameText(),
          RoleText(),
          SizedBox(height: 16),
          AddressText(),
          SizedBox(height: 72),
          DescriptionText(),
          SizedBox(height: 24),
          ContactButton(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class ResponsiveScreen5 extends StatelessWidget {
  const ResponsiveScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Screen'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                const [
                  SizedBox(height: 20),
                  HeaderText(),
                  SizedBox(height: 24),
                  ProfileAvatar(),
                  SizedBox(height: 16),
                  NameText(),
                  RoleText(),
                  SizedBox(height: 16),
                  AddressText(),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  SizedBox(height: 72),
                  DescriptionText(),
                  SizedBox(height: 24),
                  ContactButton(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({super.key, this.height = 50});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          'Contact',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
    this.padding = const EdgeInsets.all(12),
  });

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFFFF4D9),
      ),
      padding: padding,
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' *
            1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}

class AddressText extends StatelessWidget {
  const AddressText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '4 Privet Drive,\nLittle Whinging,\nSurrey,\nEngland,\nUnited Kingdom',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
      ),
    );
  }
}

class RoleText extends StatelessWidget {
  const RoleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Wizard',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class NameText extends StatelessWidget {
  const NameText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Harry Potter',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.radius = 32,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const NetworkImage(
        'https://picsum.photos/600/600',
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Profile',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
