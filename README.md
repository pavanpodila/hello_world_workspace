# Hello World

A Vyuh Flutter project created by Vyuh CLI.

> This app is powered by the [Vyuh Framework](https://vyuh.tech).

## Technologies at play

- Dart
- Flutter
- Node.js
- Vyuh Framework

## Project Structure

- All apps are in the `/apps` directory. This includes the Flutter App and the
  Sanity Studio (if using the CMS)
- All plugins are in the `/plugins` directory
- All features are in the `/features` directory
- All shared packages are in the `/packages` directory

## Project Overview

### Apps
1. **Flutter App** (`/apps/hello_world`)
   - Main Flutter application
   - Implements blog feature including:
     - Blog post models and data structures
     - Custom layouts for blog content
     - Integration with Sanity.io
     - Blog post viewing functionality
   - Uses Vyuh Framework for routing and content management

2. **Sanity Studio** (`/apps/hello-world-studio`)
   - Content Management System (CMS)
   - Implements blog schemas and structure:
     - Blog post schema with title, description, content
     - Author management
     - Categories
     - Custom layouts for content editing
   - Configured with Vyuh Sanity plugins

### Features
1. **Counter Feature** (`/features/counter/feature_counter`)
   - Sample feature implementation
   - Demonstrates basic Vyuh feature structure
   - Simple counter with state management
   - Example of feature routing

### Core Functionality
1. **Blog System**
   - Implemented across both Flutter app and Sanity Studio
   - Full blog post management
   - Author profiles with social links
   - Category organization
   - Rich text content support
   - Image handling with hotspot/crop features

2. **Content Management**
   - Sanity.io integration for content storage
   - Custom content layouts
   - Live preview support
   - Draft/published content workflow

### Technical Stack
1. **Frontend**
   - Flutter for cross-platform app
   - MobX for state management
   - GoRouter for navigation
   - JSON serialization for data handling

2. **Backend/CMS**
   - Sanity.io as headless CMS
   - TypeScript for schema definitions
   - Custom Sanity plugins

3. **Development Tools**
   - Melos for monorepo management
   - Just for task automation
   - TypeScript/Dart build tools
   - Flutter development tools

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   pnpm install
   ```

2. Run the development environment:
   ```bash
   # For Flutter app
   cd apps/hello_world
   flutter run

   # For Sanity Studio
   cd apps/hello-world-studio
   pnpm dev
   ```

For detailed setup instructions, refer to individual README files in each directory.
